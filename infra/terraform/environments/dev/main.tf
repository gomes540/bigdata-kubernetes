# Criar o bucket do GCS para armazenar o estado do Terraform
# resource "google_storage_bucket" "terraform_state" {
#   name                        = var.gcs_state_bucket
#   location                    = var.region
#   uniform_bucket_level_access = true # Recomendado para segurança

#   versioning {
#     enabled = true # Habilita versionamento para facilitar rollback de alterações
#   }

#   lifecycle {
#     prevent_destroy = true # Impede que o bucket seja destruído sem a remoção explícita
#   }

#   labels = {
#     environment = "dev"
#     project     = "gke-cluster"
#     owner       = "data-team"
#   }

# }

# Chamar o módulo para criar o cluster GKE Autopilot
module "gke_cluster" {
  source                  = "../../modules/gke"
  project_id              = var.project_id
  region                  = var.region
  cluster_name            = var.cluster_name
  enable_kubernetes_alpha = var.enable_kubernetes_alpha
  cluster_labels          = var.cluster_labels
}

# Chamar o módulo para deployar o Argocd
module "argocd" {
  source                     = "../../modules/argocd"
  namespace                  = var.argocd_namespace
  chart_version              = var.argocd_chart_version
  chart_repo                 = var.argocd_chart_repo
  chart_name                 = var.argocd_chart_name
  k8s_endpoint               = module.gke_cluster.k8s_endpoint
  k8s_token                  = module.gke_cluster.k8s_token
  k8s_cluster_ca_certificate = module.gke_cluster.k8s_cluster_ca_certificate
}

# Configuração do provider Helm para deploy do ArgoCD
provider "helm" {
  kubernetes {
    host                   = module.gke_cluster.k8s_endpoint
    token                  = module.gke_cluster.k8s_token
    cluster_ca_certificate = module.gke_cluster.k8s_cluster_ca_certificate
  }
}

# Configuração do provider Kubernetes para acesso ao cluster GKE
provider "kubernetes" {
  host                   = "https://${module.gke_cluster.k8s_endpoint}"
  token                  = module.gke_cluster.k8s_token
  cluster_ca_certificate = module.gke_cluster.k8s_cluster_ca_certificate
}

resource "kubernetes_manifest" "airbyte_dev" {
  depends_on = [module.argocd, module.gke_cluster]  # Garante que o ArgoCD seja instalado primeiro
  manifest = yamldecode(file("${path.module}/../../gitops/applications/airbyte/dev/app.yaml"))

  # Adicione uma propriedade para que o Terraform reprocessa o arquivo quando ele for alterado
  lifecycle {
    ignore_changes = [
      # Isso vai ignorar mudanças nas propriedades do app.yaml, mas o arquivo values.yaml será monitorado
      # manifest,
    ]
  }
}


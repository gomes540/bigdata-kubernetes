# Criar o bucket do GCS para armazenar o estado do Terraform
resource "google_storage_bucket" "terraform_state" {
  name                        = var.gcs_state_bucket
  location                    = var.region
  uniform_bucket_level_access = true # Recomendado para segurança

  versioning {
    enabled = true # Habilita versionamento para facilitar rollback de alterações
  }

  lifecycle {
    prevent_destroy = true # Impede que o bucket seja destruído sem a remoção explícita
  }

  labels = {
    environment = "dev"
    project     = "gke-cluster"
    owner       = "data-team"
  }

}

# Chamar o módulo para criar o cluster GKE Autopilot
module "gke_cluster" {
  source                  = "./modules/gke_cluster"
  project_id              = var.project_id
  region                  = var.region
  cluster_name            = var.cluster_name
  enable_kubernetes_alpha = var.enable_kubernetes_alpha
  cluster_labels          = var.cluster_labels
}

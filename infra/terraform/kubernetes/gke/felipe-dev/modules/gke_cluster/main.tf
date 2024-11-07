# Módulo para criar o Cluster Kubernetes no GKE com Autopilot

# Criar o cluster GKE Autopilot
resource "google_container_cluster" "autopilot_cluster" {
  name     = var.cluster_name
  location = var.region

  # Configuração para Autopilot Cluster
  enable_autopilot = true

  # Habilitar recursos alpha do Kubernetes (se necessário)
  enable_kubernetes_alpha = var.enable_kubernetes_alpha

  # Labels para o cluster
  resource_labels = var.cluster_labels
}

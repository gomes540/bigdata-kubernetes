# Módulo para criar o Cluster Kubernetes no GKE com Autopilot

# Criar o cluster GKE Autopilot
resource "google_container_cluster" "autopilot_cluster" {
  name     = var.cluster_name
  location = var.region
  initial_node_count = 3               # Define 3 nós no default node pool

  node_config {
    machine_type = "e2-medium"         # Tipo de máquina
    disk_size_gb = 50                  # Boot disk size
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  # Configuração para Autopilot Cluster
  enable_autopilot = false

  # Habilitar recursos alpha do Kubernetes (se necessário)
  enable_kubernetes_alpha = var.enable_kubernetes_alpha

  # Labels para o cluster
  resource_labels = var.cluster_labels

  # Ensure this is set to false to allow deletion
  deletion_protection = false  
}

# Data source para obter as credenciais do Google
data "google_client_config" "default" {}

# Data source para obter as informações do cluster
data "google_container_cluster" "gke_cluster" {
  name     = google_container_cluster.autopilot_cluster.name
  location = google_container_cluster.autopilot_cluster.location
}
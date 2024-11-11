# Outputs no módulo gke-cluster para fornecer informações sobre o cluster criado

output "k8s_name" {
  description = "Nome do cluster GKE"
  value       = data.google_container_cluster.gke_cluster.name
}

output "k8s_cluster_ca_certificate" {
  description = "Certificado CA do cluster Kubernetes"
  value       = base64decode(data.google_container_cluster.gke_cluster.master_auth[0].cluster_ca_certificate)
}

output "k8s_endpoint" {
  description = "Endpoint do cluster Kubernetes"
  value       = data.google_container_cluster.gke_cluster.endpoint
}

output "k8s_token" {
  description = "Token de autenticação para o cluster Kubernetes"
  value       = data.google_client_config.default.access_token
}

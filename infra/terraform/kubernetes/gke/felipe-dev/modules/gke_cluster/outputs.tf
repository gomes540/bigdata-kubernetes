# Outputs no módulo gke-cluster para fornecer informações sobre o cluster criado

output "cluster_endpoint" {
  description = "Endpoint do cluster GKE"
  value       = google_container_cluster.autopilot_cluster.endpoint
}

output "cluster_name" {
  description = "Nome do cluster GKE"
  value       = google_container_cluster.autopilot_cluster.name
}
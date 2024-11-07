# Outputs no diretório raiz para fornecer detalhes sobre o cluster GKE

output "cluster_endpoint" {
  description = "Endpoint do cluster GKE"
  value       = module.gke_cluster.cluster_endpoint
}

output "cluster_name" {
  description = "Nome do cluster GKE"
  value       = module.gke_cluster.cluster_name
}

# Output do GCS bucket onde o estado do Terraform está armazenado
output "gcs_state_bucket" {
  description = "Nome do bucket GCS usado para armazenar o estado do Terraform"
  value       = var.gcs_state_bucket
}

# Output do projeto GCP utilizado
output "project_id" {
  description = "ID do projeto GCP"
  value       = var.project_id
}

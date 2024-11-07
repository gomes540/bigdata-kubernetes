# Definição de variáveis para o módulo gke-cluster

# Nome do projeto GCP
variable "project_id" {
  description = "ID do projeto GCP"
  type        = string
}

# Região do GKE
variable "region" {
  description = "Região do GKE"
  type        = string
}

# Nome do cluster GKE
variable "cluster_name" {
  description = "Nome do cluster GKE"
  type        = string
}

# Habilitar recursos alpha do Kubernetes
variable "enable_kubernetes_alpha" {
  description = "Habilitar recursos alpha do Kubernetes"
  type        = bool
}

# Labels a serem aplicados no cluster
variable "cluster_labels" {
  description = "Labels a serem aplicados no cluster"
  type        = map(string)
  default     = {}
}

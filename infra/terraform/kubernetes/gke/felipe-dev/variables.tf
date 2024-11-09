# Definição de variáveis para o Terraform

# variables.tf
variable "project_id" {
  description = "ID do projeto GCP"
  type        = string
}

variable "region" {
  description = "Região do GKE"
  type        = string
}

variable "gcs_state_bucket" {
  description = "Nome do bucket GCS para armazenar o estado do Terraform"
  type        = string
}

variable "cluster_name" {
  description = "Nome do cluster GKE"
  type        = string
}

variable "enable_kubernetes_alpha" {
  description = "Habilitar recursos alpha do Kubernetes"
  type        = bool
  default     = false
}

# (Opcional) Labels a serem aplicados no cluster
variable "cluster_labels" {
  description = "Labels a serem aplicados no cluster"
  type        = map(string)
}

variable "argocd_namespace" {
  description = "Namespace onde o ArgoCD será instalado"
  type        = string
}

variable "argocd_chart_version" {
  description = "Versão do chart do ArgoCD"
  type        = string
}

variable "argocd_chart_repo" {
  description = "Repositório do chart do ArgoCD"
  type        = string
}

variable "argocd_chart_name" {
  description = "Nome do chart do ArgoCD"
  type        = string
}

# variables.tf

variable "namespace" {
  description = "Namespace onde o ArgoCD será instalado"
  type        = string
}

variable "chart_version" {
  description = "Versão do chart do ArgoCD"
  type        = string
}

variable "chart_name" {
  description = "Nome do chart do ArgoCD"
  type        = string
}

variable "chart_repo" {
  description = "Repositório do chart do ArgoCD"
  type        = string
}

variable "k8s_endpoint" {
  description = "Endpoint do cluster Kubernetes"
  type        = string
}

variable "k8s_token" {
  description = "Token de autenticação do Kubernetes"
  type        = string
}

variable "k8s_cluster_ca_certificate" {
  description = "Certificado CA do cluster Kubernetes"
  type        = string
}

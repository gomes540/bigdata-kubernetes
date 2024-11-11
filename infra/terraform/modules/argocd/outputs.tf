# Exibe o URL do servidor ArgoCD, útil para verificar o serviço após o deploy
output "argocd_server_url" {
  description = "URL do servidor ArgoCD"
  value       = helm_release.argocd.status
}

# Opcional: Exibe o namespace onde o ArgoCD foi implantado
output "argocd_namespace" {
  value       = var.namespace
  description = "Namespace where ArgoCD is deployed"
}

output "server_url" {
  description = "URL do servidor ArgoCD"
  value       = "https://argocd.${var.namespace}.svc.cluster.local"
}
# helm.tf

# Deploy do ArgoCD usando o provider Helm
resource "helm_release" "argocd" {
  name            = "argocd"
  namespace       = var.namespace
  repository      = var.chart_repo
  chart           = var.chart_name
  version         = var.chart_version
  create_namespace = true
  values          = [file("${path.module}/values.yaml")]
}

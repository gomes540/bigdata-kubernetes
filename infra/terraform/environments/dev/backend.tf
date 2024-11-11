# Configuração do Backend Remoto para armazenar o estado no GCS
terraform {
  backend "gcs" {
    bucket = "gke-dev-data-platform-terraform-state" # Usando a variável para o nome do bucket, para maior flexibilidade
    prefix = "terraform/dev/state"    # Prefixo dentro do bucket
  }
}

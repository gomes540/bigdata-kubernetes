# Configuração do Backend Remoto para armazenar o estado no GCS
terraform {
  backend "gcs" {
    bucket = var.gcs_state_bucket # Usando a variável para o nome do bucket, para maior flexibilidade
    prefix = "terraform/state"    # Prefixo dentro do bucket
  }
}

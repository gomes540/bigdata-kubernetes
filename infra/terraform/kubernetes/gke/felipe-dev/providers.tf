terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.10.0" # Substitua por uma versão específica, se necessário
    }
  }
}

# Definir o provedor Google Cloud
provider "google" {
  project = var.project_id
  region  = var.region
}


terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.4.9"
    }
  }
  backend "gcs" {
    bucket = "dlyle-state-bucket"
    prefix = "terraform/state/workspace-david_lyle-cluster-1"
  }
}

provider "google" {
  project = var.google_project
  region  = "us-central1"
  zone    = "us-central1-c"
}

provider "databricks" {
  alias                  = "workspace"
  host                   = var.workspace_host
  google_service_account = ""
  token                  = var.databricks_token
}

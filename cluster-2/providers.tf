
terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.4.9"
    }
  }
  backend "gcs" {
    bucket = "dlyle-state-bucket"
    prefix = "terraform/state/workspace-david_lyle-terraform-demo"
  }
}

provider "google" {
  project = var.google_project
  region  = "us-west1"
  zone    = "us-west1-c"
}

data "terraform_remote_state" "service-account" {
  backend = "gcs"
  config = {
    bucket  = "dlyle-state-bucket"
    prefix  = "terraform/state/service-acct"
  }
}

provider "databricks" {
  alias                  = "accounts"
  host                   = "https://accounts.gcp.databricks.com"
  google_service_account = data.terraform_remote_state.service-account.outputs.service_account
  token                  = ""
}

provider "databricks" {
  alias                  = "workspace"
  host                   = module.cluster-2-workspace.workspace_url
  google_service_account = data.terraform_remote_state.service-account.outputs.service_account
  token                  = ""
}

terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.4.9"
    }
    google = {
      source = "hashicorp/google"
      version = "4.10.0"
    }
  }
}
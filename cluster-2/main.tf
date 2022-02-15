#call the modules
module "cluster-2-workspace" {
  source = "../modules/workspace"
  providers = {
    google = google
    databricks = databricks.accounts
  }
  databricks_account_id = var.databricks_account_id
  workspace_name = "dlyle-terraform-demo-workspace"
}

module "cluster-2-data_platform" {
  source = "../modules/data_platform"
  providers = {
    google     = google
    databricks = databricks.workspace
  }
  user_map = var.user_map
  depends_on = [module.cluster-2-workspace]
}

output "workspace_url" {
  value = module.cluster-2-workspace.workspace_url
}
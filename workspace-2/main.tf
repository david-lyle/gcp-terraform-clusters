#call the modules
module "workspace-2-workspace" {
  source = "../modules/workspace"
  providers = {
    google = google
    databricks = databricks.accounts
  }
  databricks_account_id = var.databricks_account_id
  workspace_name = "dlyle-terraform-demo-workspace"
}

module "workspace-2-data_platform" {
  source = "../modules/data_platform"
  providers = {
    google     = google
    databricks = databricks.workspace
  }
  depends_on = [module.workspace-2-workspace, module.workspace-2-users]
  cost_center_10011_authorized_group = "Cost Center 10011"
  repo_map = {
    "/Repos/david.lyle@databricks.com/databricks-notebooks/" = "https://github.com/david-lyle/databricks-notebooks",
  }
}

module "workspace-2-users" {
  source = "github.com/dlyle65535/terraform-databricks-usergroups"
  providers = {
    databricks = databricks.workspace
  }
  user_map = var.user_map
  depends_on = [module.workspace-2-workspace]
}

output "workspace_url" {
  value = module.workspace-2-workspace.workspace_url
}

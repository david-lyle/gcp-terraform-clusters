#call the modules
module "cluster-1-data_platform" {
  source = "../modules/data_platform"
  providers = {
    google     = google
    databricks = databricks.workspace
  }
  user_map = var.user_map
}
data "google_client_openid_userinfo" "me" {
}

data "google_client_config" "current" {}

resource "databricks_mws_workspaces" "this" {
 account_id     = var.databricks_account_id
 workspace_name = var.workspace_name
 location       = data.google_client_config.current.region
 
 cloud_resource_bucket {
   gcp {
     project_id = data.google_client_config.current.project
   }
 }
}


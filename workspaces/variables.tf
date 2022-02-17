variable "google_project" {}
variable "databricks_account_id" {}
variable workspace_name {}
variable region {}
variable zone {}
variable user_map {
  type = map(object({
    admin = bool
    groups = list(string)
  }))
}

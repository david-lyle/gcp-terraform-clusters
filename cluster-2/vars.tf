variable "google_project" {}
variable "databricks_account_id" {}
variable user_map {
  type = map(object({
    admin = bool
    cs10011 = bool
  }))
}

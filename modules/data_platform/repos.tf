resource "databricks_repo" "repos" {
    for_each = var.repo_map
    url = each.value
    path = each.key  
}
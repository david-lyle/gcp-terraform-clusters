resource "databricks_permissions" "clust_policy_cost_center_10011" {
  cluster_policy_id = databricks_cluster_policy.cost_center_10011.id
  access_control {
    permission_level = "CAN_USE"
    group_name       = var.cost_center_10011_authorized_group
  }
}

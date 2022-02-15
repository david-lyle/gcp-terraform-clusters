resource "databricks_group" "cost_center_10011" {
  display_name = "Cost Center 10011"
}

resource "databricks_group_member" "cost_center_10011_" {
  for_each = { for k in compact([for k, v in var.user_map: v.cs10011 ? k : ""]): k => var.user_map[k]  }
  group_id  = databricks_group.cost_center_10011.id
  member_id = databricks_user.user[each.key].id
}


data "databricks_group" "admins" {
  display_name = "admins"
  provider = databricks
}

resource "databricks_group_member" "admin_member" {
  for_each = { for k in compact([for k, v in var.user_map: v.admin ? k : ""]): k => var.user_map[k]  }
  group_id  = data.databricks_group.admins.id
  member_id = databricks_user.user[each.key].id
}

resource "databricks_user" "user" {
  for_each =  var.user_map
  user_name = each.key
  active    = true
  workspace_access = true
}





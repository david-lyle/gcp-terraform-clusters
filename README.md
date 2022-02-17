# Databricks GCP Terraform Example

### Prereqs
This project supports the creation and population of 2 Databricks workspaces with example Clusters/Pools/Users/Groups/Jobs/etc. 

Shard state separation is maintained by using [terraform state workspces](https://www.terraform.io/language/state/workspaces).

### File of Interest
#### workspaces/providers.tf
You can modify the Google provider to match the region of your pre-provisioned workspace.

In addition, change 'google_service_account' in the Databricks providers to match the service account you've created for provisioning.

#### workspaces/terrraform.tfvars
Define the user_map here if the users are the same on all shards as shown below:
```terraform
user_map = {
  "foo@example.com" = {
    admin   = true
    groups = ["list", "of", "group", "memberships"]
  }
  "bar@example.com" = {
    admin   = false
    groups = []
  }
}
```

Note: admins are automatically added to the 'admin' group and all users are automatically added to the 'users' group.

Also add the Google Project and Databricks account ID.
```terraform
google_project = "<google-project-id>"
databricks_account_id = "<databricks-account-id>"
```

#### workspces/workspace-1/terraform.tfvars
```terraform
workspace_name = "<workspace 1 name>"
region = "<region>"
zone = "<zone>"
```

#### workspace-2/terraform.tfvars
```terraform
workspace_name = "<workspace 2 name>"
region = "<region>"
zone = "<zone>"
```

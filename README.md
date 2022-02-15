#Databricks GCP Terraform Example

###Prereqs
This project supports the creation and population of 2 Databricks workspaces with example Clusters/Pools/Users/Groups/Jobs/etc. Workspace 1 should be provisioned using the Databricks [admin page](https://accounts.gcp.databricks.com/). 

Workspace 2 is created automatically by Terraform.

###File of Interest
####workspace-1/providers.tf
You can modify the Google provider to match the region of your pre-provisioned workspace.

####workspace-2/providers.tf
As above, you can modify the Google provider to target the region where you'd like the workspace provisioned.

In addition, change 'google_service_account' in the Databricks providers to match the service account you've created for provisioning.

####workspace-1/terraform.tfvars
```terraform
google_project = "<your google project name>"
databricks_account_id = "<your databricks account id>"
databricks_token = "<your databricks PAT>"
workspace_host = "https://<workspace_id>.gcp.databricks.com"
#user map contains all the users you want provisioned as well as 
#an example of group membership
user_map = {
  "foo@example.com" = {
    admin   = true
    cs10011 = true
  }
  "bar@example.com" = {
    admin   = false
    cs10011 = false
  }
}
```
####workspace-2/terraform.tfvars
```terraform
google_project = "<your google project name>"
databricks_account_id = "<your databricks account id>"
#user map contains all the users you want provisioned as well as 
#an example of group membership
user_map = {
  "foo@example.com" = {
    admin   = true
    cs10011 = true
  }
  "bar@example.com" = {
    admin   = false
    cs10011 = false
  }
}
```
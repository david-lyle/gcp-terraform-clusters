resource "databricks_job" "warm_pool_402" {
  schedule {
    timezone_id            = "America/Chicago"
    quartz_cron_expression = "00 00 09 ? * MON,TUE,WED,THU,FRI *"
  }

  notebook_task {
    notebook_path = "/Repos/david.lyle@databricks.com/databricks-notebooks/Pool Warming Job Notebook"
  }
  new_cluster {
    spark_version = "9.1.x-scala2.12"
    spark_env_vars = {
      PYSPARK_PYTHON = "/databricks/python3/bin/python3"
    }
    policy_id        = databricks_cluster_policy.cost_center_10011.id
    num_workers      = 8
    instance_pool_id = databricks_instance_pool.dlyle_cluster_pool.id
    custom_tags = {
      CostCenter = "10011"
    }
  }
  name                = "warm-pool"
  max_concurrent_runs = 1
  email_notifications {
  }
  always_running = false
}

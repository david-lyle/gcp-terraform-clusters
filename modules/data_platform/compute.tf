resource "databricks_cluster_policy" "cost_center_10011" {
  name       = "Cost Center 10011"
  definition = "{\n  \"custom_tags.CostCenter\": {\n    \"type\": \"fixed\",\n    \"value\": \"10011\"\n  }\n}"
}

resource "databricks_instance_pool" "dlyle_cluster_pool" {
  preloaded_spark_versions              = ["9.1.x-scala2.12"]
  node_type_id                          = "n1-highmem-4"
  min_idle_instances                    = 0
  max_capacity                          = 20
  instance_pool_name                    = "dlyle-cluster-pool"
  idle_instance_autotermination_minutes = 60
  enable_elastic_disk                   = false
}

resource "databricks_cluster" "dlyle_job_cluster_0207_154839_9ufj3646" {
  spark_version = "9.1.x-scala2.12"
  spark_env_vars = {
    PYSPARK_PYTHON = "/databricks/python3/bin/python3"
  }
  policy_id = databricks_cluster_policy.cost_center_10011.id
  gcp_attributes {
    google_service_account = "david-lyle@fe-dev-sandbox.iam.gserviceaccount.com"
  }
  custom_tags = {
    CostCenter = "10011"
  }
  cluster_name            = "dlyle-job-cluster"
  autotermination_minutes = 120
  autoscale {
    min_workers = 2
    max_workers = 8
  }
}

resource "databricks_cluster" "dlyle_prometheus_listener_test_0211_151127_9l48xr7o" {
  spark_version = "9.1.x-scala2.12"
  gcp_attributes {
    google_service_account = "david-lyle@fe-dev-sandbox.iam.gserviceaccount.com"
  }
  cluster_name            = "dlyle-prometheus-listener-test"
  autotermination_minutes = 120
  autoscale {
    min_workers = 2
    max_workers = 8
  }
}

resource "databricks_cluster" "dlyle_test_0118_203711_inn93" {
  spark_version = "10.2.x-cpu-ml-scala2.12"
  spark_conf = {
    "spark.ui.prometheus.enabled" = "true"
  }
  init_scripts {
    dbfs {
      destination = format("%s%s", "dbfs:", databricks_dbfs_file._install_prometheus_sh_b4ded9698b3c03d69dab9d8b42bb02cb.id)
    }
  }
  gcp_attributes {
    google_service_account = "david-lyle@fe-dev-sandbox.iam.gserviceaccount.com"
  }
  custom_tags = {
    CostCenter = "10011"
  }
  cluster_name            = "dlyle-test"
  autotermination_minutes = 120
  autoscale {
    min_workers = 2
    max_workers = 8
  }
}

resource "databricks_cluster" "dlyle_test_connect_0121_161717_ail888" {
  spark_version = "9.1.x-cpu-ml-scala2.12"
  policy_id     = databricks_cluster_policy.cost_center_10011.id
  gcp_attributes {
    google_service_account = "david-lyle@fe-dev-sandbox.iam.gserviceaccount.com"
  }
  custom_tags = {
    CostCenter = "10011"
  }
  cluster_name            = "dlyle-test-connect"
  autotermination_minutes = 120
  autoscale {
    min_workers = 2
    max_workers = 8
  }
}

resource "databricks_cluster" "dlyle_test_photon_0119_213156_fax211" {
  spark_version = "10.2.x-photon-scala2.12"
  policy_id     = databricks_cluster_policy.cost_center_10011.id
  init_scripts {
    dbfs {
      destination = format("%s%s", "dbfs:", databricks_dbfs_file._install_banzaicloud_sh_072f8ff6b311819c71a11ffda07a2df3.id)
    }
  }
  gcp_attributes {
  }
  custom_tags = {
    CostCenter = "10011"
  }
  cluster_name = "dlyle-test-photon"
  cluster_log_conf {
    dbfs {
      destination = "dbfs:/cluster-logs"
    }
  }
  autotermination_minutes = 120
  autoscale {
    min_workers = 2
    max_workers = 8
  }
}

resource "databricks_cluster" "dlyle_test_prometheus_0204_195730_3iao9pw1" {
  spark_version = "9.1.x-scala2.12"
  spark_env_vars = {
    PYSPARK_PYTHON = "/databricks/python3/bin/python3"
  }
  instance_pool_id = databricks_instance_pool.dlyle_cluster_pool.id
  init_scripts {
    dbfs {
      destination = format("%s%s", "dbfs:", databricks_dbfs_file._install_banzaicloud_sh_072f8ff6b311819c71a11ffda07a2df3.id)
    }
  }
  gcp_attributes {
    google_service_account = "david-lyle@fe-dev-sandbox.iam.gserviceaccount.com"
  }
  cluster_name = "dlyle-test-prometheus"
  cluster_log_conf {
    dbfs {
      destination = "dbfs:/cluster-logs"
    }
  }
  autotermination_minutes = 120
  autoscale {
    min_workers = 2
    max_workers = 8
  }
}

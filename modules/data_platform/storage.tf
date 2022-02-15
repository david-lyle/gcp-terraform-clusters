resource "databricks_dbfs_file" "_install_banzaicloud_sh_072f8ff6b311819c71a11ffda07a2df3" {
  path   = "/dlyle/install-banzaicloud.sh"
  source = "${path.module}/files/_install-banzaicloud.sh_072f8ff6b311819c71a11ffda07a2df3"
}
resource "databricks_dbfs_file" "_install_prometheus_sh_b4ded9698b3c03d69dab9d8b42bb02cb" {
  path   = "/dlyle/install-prometheus.sh"
  source = "${path.module}/files/_install-prometheus.sh_b4ded9698b3c03d69dab9d8b42bb02cb"
}

locals {
  name-web = "${var.default_zone_a}-${var.vpc_name}-${var.vm_web_name}"
  name-db = "${var.default_zone_b}-${var.vpc_name}-${var.vm_db_name}"
}

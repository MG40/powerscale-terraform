# This is the main Terraform configuration file that will be used to create the Isilon resources.
# The file contains the following modules:
# filesystem    - Creates a filesystem in PowerScale
# accesszone    - Creates an access zone in PowerScale
# user_group    - Creates a user group in PowerScale
# user          - Creates a user in PowerScale
# networkpool   - Creates a network pool in PowerScale
# nfs_export    - Exports the filesystem using NFS

# Powerscale Terraform provider configuration
terraform {
  required_providers {
    powerscale = {
      version = "1.5.0"
      source = "registry.terraform.io/dell/powerscale"
    }
  }
}

# Powerscale provider configuration
provider "powerscale" {
  username = var.username
  password = var.password
  endpoint = var.endpoint
  insecure = var.insecure
}

# Filesystem module to create a filesystem in PowerScale
module "tf_filesystem" {
  source = "./modules/filesystem"
  filesystem_directory_path = "/ifs"
  filesystem_name = "terraform"
  filesystem_group_id = "GID:0"
  filesystem_group_name = "wheel"
  filesystem_group_type = "group"
  filesystem_owner_id = "UID:0"
  filesystem_owner_name = "root"
  filesystem_owner_type = "user"
  filesystem_access_control = "0777"
}

# Accesszone module to create an access zone in PowerScale
module "tf_accesszone" {
  source = "./modules/accesszone"
  accesszone_groupnet = "groupnet0"
  accesszone_name = "terraform-zone"
  accesszone_path = module.tf_filesystem.output_file_system
}

# User group module to create a user group in PowerScale
module "tf_user_group" {
  source = "./modules/user_group"
  depends_on = [module.tf_accesszone]
  user_group_name = "terraform"
  user_group_id = "20000"
  user_group_query_force = false
  user_group_query_zone = module.tf_accesszone.output_access_zone_id
  user_group_query_provider = "Local:${module.tf_accesszone.output_access_zone_id}"
}

# User module to create a user in PowerScale
module "tf_user" {
  source = "./modules/user"
  depends_on = [module.tf_accesszone]
  user_name = "tfadmin"
  user_id = "20000"
  user_query_force = false
  user_query_zone = module.tf_accesszone.output_access_zone_id
  user_query_provider = "Local:${module.tf_accesszone.output_access_zone_id}"
  user_password = var.user_password
  user_roles = ["ZoneAdmin"]
  user_enabled = true
  user_unlock = true
  user_password_expires = false
  user_primary_group = module.tf_user_group.output_user_group
}

# Networkpool module to create a network pool in PowerScale
module "tf_networkpool" {
  source = "./modules/networkpool"
  networkpool_name = "terraform-pool"
  networkpool_groupnet = "groupnet0"
  networkpool_subnet = "subnet-504"
  networkpool_access_zone_name = module.tf_accesszone.output_access_zone_id
  networkpool_aggregation_mode = "lacp"
  networkpool_alloc_method = "static"
  networkpool_description = "Terraform network pool"
  networkpool_ifaces = var.networkpool_ifaces
  networkpool_nfsv3_rroce_only = false
  networkpool_ranges = var.networkpool_ranges
  networkpool_rebalance_policy = "auto"
  networkpool_sc_auto_unsuspend_delay = 0
  networkpool_sc_connect_policy = "round_robin"
  networkpool_sc_dns_zone = "terraform.isilon.com"
  networkpool_sc_subnet = "subnet-504"
}

# NFS export module to export the filesystem using NFS
module "tf_nfs_export" {
  source = "./modules/nfs_export"
  nfs_export_path = [module.tf_filesystem.output_file_system]
  nfs_export_zone = module.tf_accesszone.output_access_zone_id
  nfs_export_all_dirs = true
}
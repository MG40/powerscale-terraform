terraform {
  required_providers {
    powerscale = {
      version = "1.5.0"
      source = "registry.terraform.io/dell/powerscale"
    }
  }
}

# This file contains the terraform configuration to create a network pool on the PowerScale cluster.
# The network pool is created with the name, groupnet, subnet, and other parameters provided in the input variables.
# The network pool is created with the access zone provided by the accesszone module.


resource "powerscale_networkpool" "network_pool" {
  name = var.networkpool_name
  groupnet = var.networkpool_groupnet
  subnet = var.networkpool_subnet
  access_zone = var.networkpool_access_zone_name
  aggregation_mode = var.networkpool_aggregation_mode
  alloc_method = var.networkpool_alloc_method
  description = var.networkpool_description
  ifaces = var.networkpool_ifaces
  nfsv3_rroce_only = var.networkpool_nfsv3_rroce_only
  ranges = var.networkpool_ranges
  rebalance_policy = var.networkpool_rebalance_policy
  sc_auto_unsuspend_delay = var.networkpool_sc_auto_unsuspend_delay
  sc_connect_policy = var.networkpool_sc_connect_policy
  sc_dns_zone = var.networkpool_sc_dns_zone
  sc_subnet = var.networkpool_subnet
}
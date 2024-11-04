########################################################################################
# The networkpool module creates a network pool in PowerScale
# We need the name, groupnet, subnet, accesszone, aggregation mode, alloc method, description, and ifaces
# PowerScale Groupnet sits above subnets and pools and allows separate Access Zones to contain distinct DNS settings.
########################################################################################

variable "networkpool_name" {
  description = "Name of the network pool"
  type = string
}

# Please fill the groupnet
# Note: The groupnet should already be existing
variable "networkpool_groupnet" {
  description = " Name of the groupnet"
  type = string
}

variable "networkpool_subnet" {
  description = "Subnet for the network pool"
  type = string
}

variable "networkpool_aggregation_mode" {
  description = "Aggregation mode for the network pool"
  type = string
}

variable "networkpool_alloc_method" {
  description = "Allocation method for the network pool"
  type = string
}

variable "networkpool_description" {
  description = "Description for the network pool"
  type = string
}

variable "networkpool_ifaces" {
  description = "List of interfaces"
  type = list(object({
    iface = string
    lnn   = number
  }))
}

variable "networkpool_nfsv3_rroce_only" {
  description = "NFSv3 RoCE only setting"
  type = bool
}

variable "networkpool_ranges" {
  description = "IP ranges for the network pool"
  type = list(object({
    high = string
    low  = string
  }))
}

variable "networkpool_rebalance_policy" {
  description = "Rebalance policy for the network pool"
  type = string
}

variable "networkpool_sc_auto_unsuspend_delay" {
  description = "Auto unsuspend delay for SmartConnect"
  type = number
}

variable "networkpool_sc_connect_policy" {
  description = "SmartConnect connection policy"
  type = string
}

variable "networkpool_sc_dns_zone" {
  description = "SmartConnect DNS zone"
  type = string
}

variable "networkpool_sc_subnet" {
  description = "SmartConnect Subnet"
  type = string
}

variable "networkpool_access_zone_name" {
  description = "Access Zone name"
  type = string
}

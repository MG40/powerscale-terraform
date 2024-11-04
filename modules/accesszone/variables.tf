########################################################################################
# The variable names and types created an accesszone in PowerScale                     #
########################################################################################

# Please fill the accesszone name
# Note: The accesszone name should be unique

# Please fill the groupnet
# Note: The groupnet should already be existing
variable "accesszone_groupnet" {
  description = " Name of the groupnet"
  type = string
}

variable "accesszone_name" {
  description = "Name of the accesszone"
  type = string
}

variable "accesszone_path" {
  description = "Path of the accesszone"
  type = string
}


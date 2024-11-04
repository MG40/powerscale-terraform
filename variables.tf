
# This file contains the variables that are used in the main.tf file
# The variables are defined with default values and descriptions
# Please use the values that are appropriate for your environment

########################################################################################
# Below variables are to connect to the PowerScale cluster
# We need the username, password, endpoint, and insecure connection details
########################################################################################

variable "username" {
  description = "Username for PowerScale"
  type = string
  default = "username"
}

variable "password" {
  description = "Password for PowerScale"
  type = string
  sensitive = true
  default = "password"
}

variable "endpoint" {
  description = "API endpoint for PowerScale"
  type = string
  default = "https://endpoint:1234"
}

variable "insecure" {
  description = "Allow insecure connections"
  type = bool
  default = true
}

########################################################################################
# The user module creates a user group in PowerScale
# We need the name and uid of the user
# The accesszone id is implicitly passed from the accesszone module
########################################################################################

variable "user_password" {
  description = "User ID for the user"
  type = string
  sensitive = true
  default = "user_password"
}

variable "user_roles" {
  description = "Roles for the user"
  type = list(string)
  default = ["user_roles"]
}

########################################################################################
# The networkpool module creates a network pool in PowerScale
# We need the name, groupnet, subnet, accesszone, aggregation mode, alloc method, description, and ifaces
########################################################################################


variable "networkpool_ifaces" {
  description = "List of interfaces"
  type = list(object({
    iface = string
    lnn   = number
  }))
  default = [
    { iface = "1", lnn = 1 },
    { iface = "1", lnn = 2 },
    { iface = "1", lnn = 3 }
  ]
}

variable "networkpool_ranges" {
  description = "IP ranges for the network pool"
  type = list(object({
    high = string
    low  = string
  }))
  default = [
    { high = "1.2.3.5", low = "1.2.3.1" }
  ]
}
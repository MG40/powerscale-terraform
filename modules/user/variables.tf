########################################################################################
# The user module creates a user group in PowerScale
# We need the name and uid of the user
# The accesszone id is implicitly passed from the accesszone module
########################################################################################

variable "user_name" {
  description = "Username for PowerScale"
  type = string
}

variable "user_id" {
  description = "User ID for the user"
  type = string
}

variable "user_query_force" {
  description = "Force the query"
  type = bool
}

variable "user_query_zone" {
  description = "User Query Zone for the user"
  type = string
}

variable "user_query_provider" {
  description = "User Query Provider for the user"
  type = string
}

variable "user_password" {
  description = "User ID for the user"
  type = string
  sensitive = true
}

variable "user_roles" {
  description = "Roles for the user"
  type = list(string)
}

variable "user_enabled" {
  description = "Enable the user"
  type = bool
}

variable "user_unlock" {
  description = "Unlock the user"
  type = bool
}

variable "user_password_expires" {
    description = "Password expires"
    type = bool
}

variable "user_primary_group" {
  description = "Primary group for the user"
  type = string
  sensitive = true
}
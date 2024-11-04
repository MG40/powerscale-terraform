########################################################################################
# The user_group module creates a user group in PowerScale
# We need the name and gid of the user group

########################################################################################

# Please fill the user group name

variable "user_group_name" {
  description = "Group name to be created in PowerScale"
  type = string
}

variable "user_group_id" {
  description = "Group ID for the user group"
  type = string
}

variable "user_group_query_force" {
  description = "Force the query"
  type = bool
}

variable "user_group_query_zone" {
  description = "Query zone for the user group"
  type = string
}

variable "user_group_query_provider" {
  description = "Query Provider for the user group"
  type = string
}
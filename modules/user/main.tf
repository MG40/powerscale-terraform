terraform {
  required_providers {
    powerscale = {
      version = "1.5.0"
      source = "registry.terraform.io/dell/powerscale"
    }
  }
}

resource "powerscale_user" "user" {
  name = var.user_name
  uid = var.user_id
  query_force = var.user_query_force
  query_zone = var.user_query_zone
  query_provider = var.user_query_provider
  password = var.user_password
  roles = var.user_roles
  enabled = var.user_enabled
  unlock = var.user_unlock
  password_expires = var.user_password_expires
  primary_group = var.user_primary_group
}
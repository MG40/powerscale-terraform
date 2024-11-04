terraform {
  required_providers {
    powerscale = {
      version = "1.5.0"
      source = "registry.terraform.io/dell/powerscale"
    }
  }
}

resource "powerscale_user_group" "user_group" {
  name = var.user_group_name
  gid = var.user_group_id
  query_force = var.user_group_query_force
  query_zone = var.user_group_query_zone
  query_provider = var.user_group_query_provider
}
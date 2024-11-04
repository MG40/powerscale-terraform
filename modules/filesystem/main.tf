# Powerscale Terraform provider configuration
terraform {
  required_providers {
    powerscale = {
      version = "1.5.0"
      source = "registry.terraform.io/dell/powerscale"
    }
  }
}

# This file contains the terraform configuration to create a filesystem on PowerScale
# The filesystem is created with the name and path provided in the input variables
# The filesystem is created with the owner and group provided in the input variables
# The access control is set to the value provided in the input variables

resource "powerscale_filesystem" "file_system" {
  directory_path = var.filesystem_directory_path
  name = var.filesystem_name
  group = {
    id = var.filesystem_group_id
    name = var.filesystem_group_name
    type = var.filesystem_group_type
  }
  owner = {
    id = var.filesystem_owner_id
    name = var.filesystem_owner_name
    type = var.filesystem_owner_type
  }
  access_control = var.filesystem_access_control
}
# Powerscale Terraform provider configuration
terraform {
  required_providers {
    powerscale = {
      version = "1.5.0"
      source = "registry.terraform.io/dell/powerscale"
    }
  }
}

# This file creates an access zone in the PowerScale cluster
# The access zone is created with the name and path provided in the input variables
# The path is the full path of the filesystem created in the filesystem module
# The access zone is created in the groupnet provided in the input variables

resource "powerscale_accesszone" "access_zone" {
  groupnet = var.accesszone_groupnet
  name = var.accesszone_name
  path = var.accesszone_path
}
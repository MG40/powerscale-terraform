terraform {
  required_providers {
    powerscale = {
      version = "1.5.0"
      source = "registry.terraform.io/dell/powerscale"
    }
  }
}

resource "powerscale_nfs_export" "nfs_export" {
  paths = var.nfs_export_path
  zone = var.nfs_export_zone
  all_dirs = var.nfs_export_all_dirs
}
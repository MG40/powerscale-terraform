########################################################################################
# The NFS Export module in PowerScale
########################################################################################

variable "nfs_export_path" {
  description = "NFS Export"
  type = list(string)
}

variable "nfs_export_zone" {
  description = "NFS Export zone"
  type = string
}

variable "nfs_export_all_dirs" {
  description = "Export all directories"
  type = bool
}

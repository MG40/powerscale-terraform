# Output the full path of the filesystem
output "tf_full_path" {
  description = "The full path of the filesystem"
  value       = module.tf_filesystem.output_file_system
}

# Output the ID of the access zone
output "tf_accesszone_id" {
  description = "The ID of the access zone"
  value       = module.tf_accesszone.output_access_zone_id
}
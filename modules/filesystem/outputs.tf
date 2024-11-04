# Output the full path of the filesystem
output "output_file_system" {
  description = "The full path of the filesystem"
  value       = powerscale_filesystem.file_system.full_path
}
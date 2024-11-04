# This file contains the output variables for the access zone module
output "output_access_zone_id" {
  description = "The Access ID created in the PowerScale cluster"
  value       = powerscale_accesszone.access_zone.id
}
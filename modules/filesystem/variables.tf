#####################################################################################
# The filesystem module creates a filesystem in PowerScale                          #
# Change the default values of the variables as per your requirement                #
#####################################################################################

# Note: The filesystem name should be unique
variable "filesystem_name" {
  description = "Name of the filesystem"
  type = string
}

# Note: The main directory path should already be existing in PowerScale
# By default, the directory path is "/ifs"
variable "filesystem_directory_path" {
  description = "Path for the filesystem"
  type = string
}

# Note: The group and owner should already be existing in PowerScale
variable "filesystem_group_id" {
  description = "Group ID for the filesystem"
  type = string
}

variable "filesystem_group_name" {
  description = "The group of the Filesystem"
  type = string
}

variable "filesystem_group_type" {
  description = "Type whether Owner or group"
  type = string
}

variable "filesystem_owner_id" {
  description = "Owner ID for the filesystem"
  type = string
}

variable "filesystem_owner_name" {
  description = "The Owner of the Filesystem"
  type = string
}

# Note: The owner type should be either user or group
variable "filesystem_owner_type" {
  description = "Type whether user or group"
  type = string
}

# Note: The access control should be in octal format
# Please keep the best practices in mind while setting the access control
# This is an example and not suggested for Production use
variable "filesystem_access_control" {
  description = "Access control for the filesystem"
  type = string
}
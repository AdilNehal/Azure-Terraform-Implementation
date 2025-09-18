variable "force_password_change" {
  description = "Force user to change password at next login"
  type        = bool
}

variable "groups" {
  description = "list of groups to create with their properties"
  type        = list(any)
}

variable "security_enabled" {
  description = "Indicates whether the group is a security group"
  type        = bool
}

# variable "group_membership" {
#   description = "Mapping of group names to their member user principal names"
#   type        = list(any)
# }
variable "group_name" {
  description = "Name of the group"
  type        = string
}

variable "description" {
  description = "Description of the group"
  type        = string
}

variable "security_enabled" {
  description = "Indicates whether the group is a security group"
  type        = bool
}

variable "members" {
  description = "List of user principal names to be added as members of the group"
  type        = list(string)
}

variable "owners" {
  description = "List of owner object IDs to assign to the group"
  type        = list(string)
}
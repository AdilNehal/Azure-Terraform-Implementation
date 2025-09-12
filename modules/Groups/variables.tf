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
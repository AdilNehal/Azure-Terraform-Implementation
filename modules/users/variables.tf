variable "user_principal_name" {
  description = "The user's principal name (email address)"
  type        = string
}

variable "display_name" {
  description = "The display name of the user"
  type        = string
}

variable "password" {
  description = "The user's password"
  type        = string
  sensitive   = true
}

variable "force_password_change" {
  description = "Whether the user must change their password on first login"
  type        = bool
}
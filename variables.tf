variable "tenant_id" {
  description = "The Azure Active Directory tenant ID."
  type        = string
}

variable "client_id" {
  description = "The Azure Active Directory application client ID."
  type        = string
}

variable "client_secret" {
  description = "The Azure Active Directory application client secret."
  type        = string
}

variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}
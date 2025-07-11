terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "3.4.0"
    }
  }
}

provider "azuread" {
  # Configuration options
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}
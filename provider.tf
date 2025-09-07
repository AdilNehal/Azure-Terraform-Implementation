terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "3.4.0"
    }
  }
}

provider "vault" {
  address = "http://127.0.0.1:8200"
}

provider "azuread" {
  tenant_id     = data.vault_generic_secret.azure.data["tenant_id"]
  client_id     = data.vault_generic_secret.azure.data["client_id"]
  client_secret = data.vault_generic_secret.azure.data["client_secret"]
}
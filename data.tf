data "vault_generic_secret" "azure" {
  path = "secret/azure"
}

data "vault_generic_secret" "user_information" {
  path = "secret/users"
}

data "azuread_client_config" "current" {}

data "azuread_user" "readusers" {
  for_each = toset(flatten(var.groups[*].members))
  user_principal_name = each.value
}
data "vault_generic_secret" "azure" {
  path = "secret/azure"
}

data "vault_generic_secret" "user_information" {
  path = "secret/users"
}
output "vault_tenant_id" {
  value = data.vault_generic_secret.azure.data["tenant_id"]
  sensitive = true
}

output "vault_user_information" {
  value = local.user_information
  sensitive = true
}
output "vault_tenant_id" {
  value = data.vault_generic_secret.azure.data["tenant_id"]
  sensitive = true
}

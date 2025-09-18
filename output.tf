output "vault_tenant_id" {
  value = data.vault_generic_secret.azure.data["tenant_id"]
  sensitive = true
}

output "vault_user_information" {
  value = local.user_information
  sensitive = true
}

output "user_ids" {
  value = flatten([for user in module.azure_user : user.user_ids])
}

output "user_names" {
  value = flatten([for user in module.azure_user : user.user_names])
}

output "user_details" {
  value = zipmap(
    flatten([for user in module.azure_user : user.user_names]),
    flatten([for user in module.azure_user : user.user_ids])
  )
}

output "group_ids" {
  value = flatten([for group in module.azure_groups : group.group_ids])
}

output "group_names" {
  value = flatten([for group in module.azure_groups : group.group_names])
}

output "group_details" {
  value = zipmap(
    flatten([for group in module.azure_groups : group.group_names]),
    flatten([for group in module.azure_groups : group.group_ids])
  )
}

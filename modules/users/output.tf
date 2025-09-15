output "user_ids" {
  value = azuread_user.azure_users.*.id
}

output "user_names" {
  value = azuread_user.azure_users.*.display_name
}


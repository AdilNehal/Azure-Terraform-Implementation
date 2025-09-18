output "group_ids" {
  value = azuread_group.azuread_groups.*.id
}

output "group_names" {
  value = azuread_group.azuread_groups.*.display_name
}

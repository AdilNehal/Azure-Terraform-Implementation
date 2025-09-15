output "group_ids" {
  value = azuread_group.azuread_groups.*.id
}

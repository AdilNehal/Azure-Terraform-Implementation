resource "azuread_group" "azuread_groups" {
  display_name = var.group_name
  description  = var.description
  security_enabled = var.security_enabled
  members = var.members
  owners =  var.owners
}
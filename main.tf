locals {
  raw_user_information = nonsensitive(data.vault_generic_secret.user_information.data)

  # Decode each JSON string into a map/object
  user_information = {
    for k, v in local.raw_user_information :
    k => jsondecode(v)
  }
}

module "azure_user" {
  source = "./modules/users"
  for_each = local.user_information

  display_name          = each.value.display_name
  user_principal_name   = each.value.user_principal_name
  password              = each.value.password
  force_password_change = var.force_password_change
}
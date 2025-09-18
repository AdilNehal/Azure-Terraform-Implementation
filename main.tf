locals {
  raw_user_information = nonsensitive(data.vault_generic_secret.user_information.data)

  # Decode each JSON string into a map/object
  user_information = {
    for k, v in local.raw_user_information :
    k => jsondecode(v)
  }

  # Flatten group memberships into a list of maps
  # memberships = flatten([
  #   for gm in var.group_membership : [
  #     for member in gm.member_names : {
  #       group_name = gm.group_name
  #       member     = member
  #     }
  #   ]
  # ])
}

module "azure_user" {
  source = "./modules/users"
  for_each = local.user_information

  display_name          = each.value.display_name
  user_principal_name   = each.value.user_principal_name
  password              = each.value.password
  force_password_change = var.force_password_change
}

# https://discuss.hashicorp.com/t/create-user-group-and-membership-in-azure-from-a-map-list/55861/
# For the owners passing both SP & human
module "azure_groups" {
  source           = "./modules/Groups"
  for_each         = { for group in var.groups : group.group_name => group }
  group_name       = each.value.group_name
  description      = each.value.description
  security_enabled = var.security_enabled
  owners = concat(
    var.owners,                               
    [data.azuread_client_config.current.object_id] 
  )
  members = [ 
    for member_email in flatten(each.value.members) : data.azuread_user.readusers[member_email].object_id
  ]
}

// Leaving this approach for now
# module "group_member" {

#   source = "./modules/GroupMembership"

#   # Create a unique key for each membership to avoid duplicates
#   for_each = {
#     for m in local.memberships : "${m.group_name}-${m.member}" => m
#   }

#   group_object_id  = lookup(module.azure_groups.group_details, each.value.group_name)
#   member_object_id = lookup(module.azure_user.user_details, each.value.member)
# }


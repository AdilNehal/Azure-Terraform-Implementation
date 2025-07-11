include {
  path = find_in_parent_folders()
}

inputs = {
  environment = "dev"
  # Add other variables if needed, or load dev.tfvars:
}

terraform {
  extra_arguments "tfvars" {
    commands = get_terraform_commands_that_need_vars()
    arguments = [
      "-var-file=../../dev.tfvars"
    ]
  }
}

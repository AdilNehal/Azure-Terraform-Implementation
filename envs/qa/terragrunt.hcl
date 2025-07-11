include {
  path = find_in_parent_folders()
}

inputs = {
  environment = "qa"
}

terraform {
  extra_arguments "tfvars" {
    commands = get_terraform_commands_that_need_vars()
    arguments = [
      "-var-file=../../qa.tfvars"
    ]
  }
}

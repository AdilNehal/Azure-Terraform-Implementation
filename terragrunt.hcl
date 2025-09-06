/*
  uses the path_relative_from_include() function and a conditional expression to dynamically set the source for a Terraform module. 
  This is a common pattern for structuring Terragrunt projects to be DRY (Don't Repeat Yourself).
  Here, path_relative_from_include() returns the relative path from the child terragrunt.hcl file to the parent terragrunt.hcl file specified in the include block.
  If you are running Terragrunt from the same directory as the parent terragrunt.hcl (e.g., in a development setup), the function will return "." (current directory).
  ? "./modules/users" -> If the current directory is the same as the parent, it uses the local modules path.
  : "../modules/users" -> This is the "false" result. If you are running Terragrunt from a subdirectory (a child module), the function will return ".." (or some other relative path), 
  and the source_path is set to ../modules/users. This correctly navigates up one level to find the modules directory
*/

locals {
  source_path = "${path_relative_from_include() == "." ? "./modules/users" : "../modules/users"}"
}

terraform {
  source = local.source_path
}

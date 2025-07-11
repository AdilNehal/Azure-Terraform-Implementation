locals {
  source_path = "${path_relative_from_include() == "." ? "./modules/users" : "../modules/users"}"
}

terraform {
  source = local.source_path
}

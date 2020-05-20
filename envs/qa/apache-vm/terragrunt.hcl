locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract out common variables for reuse
  env       = local.environment_vars.locals.environment
  sg_ids    = local.environment_vars.locals.security_groups_ids
  subnet_id = local.environment_vars.locals.subnet_id
  key_name  = local.environment_vars.locals.key_name
}

# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  # source = "../../../modules//ec2"
  source = "${get_parent_terragrunt_dir()}/modules//ec2"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name                = "apache-${local.env}"
  instance_type       = "t3.small"
  security_groups_ids = local.sg_ids
  subnet_id           = local.subnet_id
  key_name            = local.key_name
}

dependencies {
  paths = ["../fileshare-vm"]
}

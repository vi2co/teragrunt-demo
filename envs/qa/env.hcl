# Set common variables for the environment. This is automatically pulled in in the root terragrunt.hcl configuration to
# feed forward to the child modules.
locals {
  environment         = "qa"
  security_groups_ids = ["sg-00000"]
  subnet_id           = "subnet-00000"
  key_name            = "qa"
}

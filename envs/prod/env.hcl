# Set common variables for the environment. This is automatically pulled in in the root terragrunt.hcl configuration to
# feed forward to the child modules.
locals {
  environment         = "prod"
  security_groups_ids = ["sg-000000"]
  subnet_id           = "subnet-00000"
  key_name            = "prod"
  db_subnets          = ["subnet-00000", "subnet-00000"]
}

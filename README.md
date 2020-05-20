# Manage AWS resources with Terragrunt

### Install Terraform and Terragrunt
[Install Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)

[Install Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/)

### Configure AWS credentials
[Configuring the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)

### Create / delete / apply changes to specific Terraform module (e.g. create Tomcat box EC2 instance):
In the current folder (`terragrunt/`):
```
cd envs/qa/tomcat-box/
terragrunt plan       # observe future changes
terragrunt apply      # apply changes
```
Clean up resources (if needed):
```
terragrunt destroy
```

### deploy multiple Terraform modules in a single command (e.g. apply all changes for specific environment):
In the current folder (`terragrunt/`):
```
cd envs/qa/
terragrunt plan-all
terragrunt apply-all
```
Clean up resources (if needed):
```
terragrunt destroy-all
```

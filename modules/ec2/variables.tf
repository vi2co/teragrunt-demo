variable "name" {
  description = "The name of EC2 instance"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "Private key name"
  type        = string
  default     = ""
}

variable "security_groups_ids" {
  description = "Private key name"
  type        = list 
  default     = []
}

variable "subnet_id" {
  description = "VPC Subnet ID"
  type        = string
  default     = ""
}

variable "root_volume_size" {
  description = "Root volume size"
  type        = string
  default     = "20"
}

variable "delete_root_volume_on_termination" {
  description = "Delete root volume on EC2 instance termination"
  type        = bool
  default     = true
}

variable "user_data" {
  description = "EC2 user_data file location"
  type        = string
  default     = <<-EOF
              #!/bin/bash
              yum update -y
              echo "user-data has been launched successfully" > /tmp/userdata.txt
              EOF
}

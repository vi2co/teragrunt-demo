data "aws_ami" "centos7" {
  most_recent = true
  owners      = ["679593333241"] # aws-marketplace

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }

  filter {
    name   = "name"
    values = ["CentOS Linux 7 *"]
  }
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.centos7.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = var.user_data
  vpc_security_group_ids = var.security_groups_ids
  subnet_id              = var.subnet_id
  associate_public_ip_address = true

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.root_volume_size
    delete_on_termination = var.delete_root_volume_on_termination
  }

  tags = {
    Name    = var.name
    Creator = "Terraform"
  }
}

output "autoassigned_ip" {
  value = aws_instance.this.public_ip
}

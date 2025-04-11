output "ec2_instances" {
  value = aws_instance.web.*.id
}


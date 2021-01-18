output "instance_ids" {
  value = aws_instance.example_demo.*.id
}

output "vpc_security_group_ids" {
  value = aws_security_group.example_ec2.id
}
output "instance_ids" {
  value = aws_instance.EJS_demo.*.id
}

output "vpc_security_group_ids" {
  value = aws_security_group.EJS_ec2.id
}
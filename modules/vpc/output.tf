output "vpc_id" {
  value = aws_vpc.EJS.id
}

output "public_subnets" {
  value = aws_subnet.public.*.id
}

output "private_subnets" {
  value = aws_subnet.public.*.id
}

output "vpc_security_group_ids" {
  value = aws_security_group.EJS_sg.id
}

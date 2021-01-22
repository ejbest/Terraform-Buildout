# security group for EC2 instances
resource "aws_security_group" "EJS_ec2" {
  name        = "nginx-EJS"
  description = "allow incoming HTTP traffic only"
  vpc_id      = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instances, one per availability zone
resource "aws_instance" "EJS_demo" {
  ami                         = lookup(var.ec2_amis, var.region)
  associate_public_ip_address = true
  count                       = length(var.private_subnets)
  instance_type               = var.instance_type
  subnet_id                   = element(var.private_subnets,count.index)
  user_data                   = file("${path.module}/userdata.sh")
#  vpc_security_group_ids      = [aws_security_group.EJS_ec2.id]
  # references security group created above

  tags = {
    Name = "EJS-instance-${count.index}"
  }
}

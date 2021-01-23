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

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "id_san4" {
  key_name      = "id_san4"
  public_key    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDucQlKwHep3YerDoV1Z6L4Im0txQiJAEOw7WVQMmczVTWQeKJwdLSVIuGoej7O2TANHJ6+5T7vuuWNGcujEoss+t3XaznnU7ObXojNOd4B7fo1qbfzS/jF6fDjUnoSFZhZ2rEtI4DeYqkiiUlNzUh4dyh3l+mbo3AL849/+8nUb+07nFN2f+ApFdgPDKfc4HjPoxzTPt29jgC2bHPx21/P1hQmAjz6EhmwSWfTB/mLk3ZmJJN2WBts3UgQpZaV7x6gCtEue9vJw4QVRmXUUDJqSeCN22PFLcdXjr3kbf441uLv4TTLsi0iBYXihbQJARcc6xL6pWScmV/L3Vy23k1Ey5zE8vGepznGVIS1I9pRRkOgNYnWHbc+VI6lUS72iZFlqBKrjfyzaOb320LUR+UNc1t6FzPHSRgiyOA4xsUNA1AOyMs7b7KY2ZJ61/rzalno+WD6N6RlpWOHXHtuD0tJvWCrPhDY915kiX5Tjrl3wSEJ1PYq3PBQUPSQ99A3fok= ej@NeXT-2016"
}

# EC2 instances, one per availability zone
resource "aws_instance" "EJS_demo" {
  ami                         = lookup(var.ec2_amis, var.region)
  associate_public_ip_address = true
  count                       = length(var.private_subnets)
  instance_type               = var.instance_type
  subnet_id                   = element(var.private_subnets,count.index)
  user_data                   = file("${path.module}/userdata.sh")
  vpc_security_group_ids      = [aws_security_group.EJS_ec2.id]
  # references security group created above
  key_name                    = "id_san4"
  
  tags = {
    Name = "EJS-instance-${count.index}"
  }
}


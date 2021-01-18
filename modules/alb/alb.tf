# security group for application load balancer
resource "aws_security_group" "example_alb_sg" {
  name        = "nginx-example-alb-sg"
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
  tags = {
    Name = "alb-security-group-example"
  }
}

# using ALB - instances in private subnets
resource "aws_lb" "example_lb" {
  name               = "example-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.example_alb_sg.id]
  subnets            = var.public_subnets

  tags = {
    Name = "example-lb-tf"
  }
}

# alb target group
resource "aws_alb_target_group" "docker-example-tg" {
  name     = "docker-example-alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    path = "/"
    port = 80
  }
}

# listener
resource "aws_alb_listener" "http_listener" {
  load_balancer_arn = aws_lb.example_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.docker-example-tg.arn
    type             = "forward"
  }
}

# target group attach
# using nested interpolation functions and the count parameter to the "aws_alb_target_group_attachment"
resource "aws_lb_target_group_attachment" "docker-example" {
  count            = length(var.azs)
  target_group_arn = aws_alb_target_group.docker-example-tg.arn
  target_id        = element(split(",", join(",", var.instance_ids)), count.index)
  port             = 80
}

# ALB DNS is generated dynamically, return URL so that it can be used
output "url" {
  value = "http://${aws_lb.example_lb.dns_name}/"
}

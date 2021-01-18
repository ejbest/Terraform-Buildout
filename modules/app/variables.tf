variable "instance_type" {
  default = "t2.micro"
}

variable "ec2_amis" {
  description = "Ubuntu Server 16.04 LTS (HVM)"
  type        = map

  default = {
    "us-east-1" = "ami-059eeca93cf09eebd"
    "us-east-2" = "ami-0782e9ee97725263d"
  }
}

variable "region" {
  default = "us-east-1"
}

variable "public_subnets" {}

variable "private_subnets" {}

variable "vpc_id" {}
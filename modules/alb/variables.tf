variable "azs" {
  type = list
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}


variable "region" {
  default = "us-east-1"
}

variable "public_subnets" {}

variable "private_subnets" {}

variable "vpc_id" {}

variable "instance_ids" {}
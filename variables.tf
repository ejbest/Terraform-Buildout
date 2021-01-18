variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "default"
}

variable "azs" {
  type = list
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnets_cidr" {
  type = list
  default = ["10.0.0.0/24", "10.0.2.0/24", "10.0.4.0/24"]
}

variable "private_subnets_cidr" {
  type = list
  default = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
}
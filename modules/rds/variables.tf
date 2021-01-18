variable "vpc_security_group_ids" {}


variable "engine_version" {
  default = "5.7.mysql_aurora.2.03.2"
}

variable "azs" {
  type = list
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "database_name" {
  default = "mydb"
}

variable "master_username" {
  default = "myuser"
}

variable "master_password" {
  default = "mypassword"
}

variable "backup_retention_period" {
  default = 5
}

variable "preferred_backup_window" {
  default = "07:00-09:00"
}
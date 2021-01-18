resource "aws_rds_cluster" "aurora-cluster" {
  cluster_identifier      = "aurora-cluster"
  engine                  = "aurora-mysql"
  engine_version          = var.engine_version
  availability_zones      = var.azs
  database_name           = var.database_name  
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  skip_final_snapshot     = true
#  vpc_security_group_ids  = [var.vpc_security_group_ids]
}
resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id              = "redis-cluster"
  engine                  = "redis"
  node_type               = var.redis_node_type
  num_cache_nodes         = var.redis_num_cache_nodes
  parameter_group_name    = var.redis_parameter_group_name
  engine_version          = var.redis_engine_version
  port                    = var.redis_port
}
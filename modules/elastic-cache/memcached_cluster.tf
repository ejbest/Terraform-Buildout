resource "aws_elasticache_cluster" "memcached_cluster" {
  cluster_id           = "memcached-cluster"
  engine               = "memcached"
  node_type            = var.memcached_node_type
  num_cache_nodes      = var.memcached_num_cache_nodes
  parameter_group_name = var.memcached_parameter_group_name
  port                 = var.memcached_port
}


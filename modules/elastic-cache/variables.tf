
variable "memcached_node_type" {
  default = "cache.m4.large"
}

variable "redis_node_type" {
  default = "cache.m4.large"
}

variable "memcached_port" {
  default = 11211
}

variable "redis_port" {
  default = 6379
}

variable "redis_engine_version" {
  default = "3.2.10"
}

variable "memcached_num_cache_nodes" {
  default = 2
}

variable "redis_num_cache_nodes" {
  default = 1
}

variable "memcached_parameter_group_name" {
  default = "default.memcached1.6"
}

variable "redis_parameter_group_name" {
  default = "default.redis3.2"
}
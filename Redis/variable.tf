variable "redis_subnet_group_name" {
  type        = string
  description = "Name of the subnet group for the Amazon ElastiCache Redis cluster"
}

variable "vpc-subnetids" {
  type        = list(string)
  description = "List of subnet IDs where the ElastiCache Redis cluster will be deployed"
}

variable "redis_cluster_name" {
  type        = string
  description = "Name of the Amazon ElastiCache Redis cluster"
}

variable "redis_engine" {
  type        = string
  description = "Database engine type for the ElastiCache Redis cluster"
}

variable "redis_node_type" {
  type        = string
  description = "Instance type for the ElastiCache Redis nodes"
}

variable "cache_node" {
  type        = number
  description = "Number of cache nodes in the ElastiCache Redis cluster"
}

variable "redis_parameter_group_name" {
  type        = string
  description = "Name of the parameter group for the ElastiCache Redis cluster"
}

variable "redis_engine_version" {
  type        = string
  description = "Version of the database engine for the ElastiCache Redis cluster"
}

# variable "eks_security_group_id" {
#   type        = string
#   description = "Security group ID for the Amazon EKS cluster"
# }

variable "redis_sg_name" {
  type        = string
  description = "Name of the security group for the ElastiCache Redis cluster"
}

variable "vpc_id" {
  type        = string
  description = "ID of the Virtual Private Cloud (VPC) where the ElastiCache Redis cluster will be created"
}

variable "tags" {
  type        = map(string)
  description = "Tags to associate with the resources"
}

# Create an ElastiCache subnet group for the Redis cluster
resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = var.redis_subnet_group_name
  subnet_ids = var.vpc-subnetids
}

# Create an ElastiCache Redis cluster
resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id           = var.redis_cluster_name
  engine               = var.redis_engine
  node_type            = var.redis_node_type
  num_cache_nodes      = var.cache_node
  parameter_group_name = var.redis_parameter_group_name
  engine_version       = var.redis_engine_version
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids   = [aws_security_group.redis-sg.id]
  tags                 = var.tags
}

# Create a security group for the ElastiCache Redis cluster
resource "aws_security_group" "redis-sg" {
  name   = var.redis_sg_name
  vpc_id = var.vpc_id
  tags   = var.tags

  # Define inbound rules to allow traffic on port 6379 (Redis)
  ingress {
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Define outbound rules to allow all outbound traffic
  egress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



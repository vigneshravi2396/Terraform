variable "vpc-name" {
  type        = string
  description = "Name of the Virtual Private Cloud (VPC)"
}

variable "cidrblock" {
  type        = string
  description = "CIDR block for the VPC of the Backend cluster"
}

variable "vpc_private_subnets" {
  type        = list(string)
  description = "List of private subnets for the Amazon EKS VPC"
}

variable "vpc_public_subnets" {
  type        = list(string)
  description = "List of public subnets for the Amazon EKS VPC"
}

variable "database_private_subnets" {
  type        = list(string)
  description = "List of private subnets for the RDS VPC"
}

# variable "cluster-name" {
#   type        = string
#   description = "Name of the Amazon EKS cluster"
# }

variable "tags" {
  type        = map(string)
  description = "Tags to associate with the resources"
}

variable "security_group_name" {
  type = string
  description = "This is the name of security group"
}

# variable "ecs_security_group_id" {
#   type        = string
#   description = "Security group ID for the Amazon EKS cluster"
# }

# variable "redis_sg_name" {
#   type        = string
#   description = "Name of the security group for the ElastiCache Redis cluster"
# }

# variable "vpc_id" {
#   type        = string
#   description = "ID of the Virtual Private Cloud (VPC) where the ElastiCache Redis cluster will be created"
# }
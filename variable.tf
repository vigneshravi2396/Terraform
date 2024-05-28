variable "region" {
  type        = string
  description = "Name of the Region"
}
# VPC Configuration
variable "vpc-name" {
  type        = string
  description = "Name of the VPC"
}

variable "cidr-block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "private-subnet" {
  type        = list(string)
  description = "List of private subnet CIDR blocks"
}

variable "public-subnet" {
  type        = list(string)
  description = "List of public subnet CIDR blocks"
}

variable "db-subnet" {
  type        = list(string)
  description = "List of DB subnet CIDR blocks"
}

# # RDS Configuration
variable "rds_identifier" {
  type        = string
  description = "RDS instance identifier"
}

variable "rds_engine" {
  type        = string
  description = "RDS database engine"
}

variable "rds_engine_version" {
  type        = string
  description = "RDS engine version"
}

variable "rds_engine_family" {
  type        = string
  description = "RDS engine family"
}

variable "rds_major_engine_version" {
  type        = string
  description = "RDS major engine version"
}

variable "rds_db_instance_type" {
  type        = string
  description = "RDS DB instance type"
}

variable "rds_db_name" {
  type        = string
  description = "RDS database name"
}

variable "rds_sg_name" {
  type        = string
  description = "RDS security group name"
}

variable "allocated_storage_size" {
  type        = number
  description = "Allocated storage size for RDS"
}

variable "max_allocated_storage_size" {
  type        = number
  description = "Maximum allocated storage size for RDS"
}

variable "manage_master_user_password" {
  type        = bool
  description = "Flag to manage the master user password for RDS"
}

variable "rds_db_port" {
  type        = number
  description = "RDS database port"
}

variable "multi_az" {
  type        = bool
  description = "Enable multi-AZ deployment for RDS"
}

variable "deletion_protection" {
  type        = bool
  description = "Enable deletion protection for RDS"
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Skip final snapshot when deleting RDS instance"
}

# # Redis Configuration
variable "redis_subnet_group_name" {
  type        = string
  description = "Name of the Redis subnet group"
}

variable "redis_cluster_name" {
  type        = string
  description = "Name of the Redis cluster"
}

variable "redis_engine" {
  type        = string
  description = "Redis engine type"
}

variable "redis_node_type" {
  type        = string
  description = "Redis node type"
}

variable "cache_node" {
  type        = number
  description = "Number of cache nodes for Redis"
}

variable "redis_parameter_group_name" {
  type        = string
  description = "Name of the Redis parameter group"
}

variable "redis_engine_version" {
  type        = string
  description = "Redis engine version"
}

variable "redis_sg_name" {
  type        = string
  description = "Redis security group name"
}

# variable "backup_bucket_name" {
#   type        = string
#   description = "Name of the backup bucket name"
# }

# # Secret-manager Configuration
variable "length" {
  type        = number
  description = "Length of the secret"
}

variable "special" {
  type        = bool
  description = "Flag indicating if special characters are allowed in the secret"
}

variable "name" {
  type        = string
  description = "Name of the secret"
}


# Local Value Configuration
variable "env" {
  type        = string
  description = "Environment name"
}

# Key Pair Configuration
variable "rsa_key_name" {
  type        = string
  description = "RSA Key name"
}

variable "key_pair_name" {
  type        = string
  description = "Name of the Key pair"
}

# ECR Variables
variable "ecr_names" {
  description = "Create ECR with these names"
  type        = list(string)
}

# #ECS Variables
variable "ecs_cluster_name" {
  type = string 
  description = "Name for ecs cluster creation"  
}

variable "ecs_cluster_capacity_provider" {
  type = string
  description = "Name for the ecs cluster capacity provider" 
}


# variable "subnet_ids" {
#   type = string
#   description = "public subnet ids"
# }

variable "security_group_name" {
  type = string
  description = "This is the name of security group"
}


#taskdifination servicediscovery variable 
variable "ecs_name_eureka" {
  type = string
}
variable "ecs_image_eureka" {
  type = string
}

#taskdifination gatway-service variable 
variable "ecs_name_gatway" {
  type = string
}
variable "ecs_image_gatway" {
  type = string
}

#taskdifination user-service variable 
variable "ecs_name_user" {
  type = string 
}
variable "ecs_image_user" {
  type = string
}
#taskdifination auth-service variable 
variable "ecs_name_auth" {
  type = string 
}
variable "ecs_image_auth" {
  type = string
}
#taskdifination program-service variable 
variable "ecs_name_program" {
  type = string 
}
variable "ecs_image_program" {
  type = string
}
#taskdifination payment-service variable 
variable "ecs_name_payment" {
  type = string 
}
variable "ecs_image_payment" {
  type = string
}
#taskdifination notify-service variable 
variable "ecs_name_notify" {
  type = string 
}
variable "ecs_image_notify" {
  type = string
}
#taskdifination flask-service variable 
variable "ecs_name_flask" {
  type = string 
}
variable "ecs_image_flask" {
  type = string
}
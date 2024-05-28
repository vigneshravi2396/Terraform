variable "db_subnet_group_name" {
  type        = string
  description = "Name of the DB subnet group"
}

variable "vpcid" {
  type        = string
  description = "ID of the Virtual Private Cloud (VPC) where the RDS instance will be created"
}


# variable "bg_security_group_id" {
#   type        = string
#   description = "Security group ID for the RDS instance"
# }

variable "rds_identifier" {
  type        = string
  description = "Identifier for the RDS instance"
}

variable "rds_engine" {
  type        = string
  description = "Database engine type for the RDS instance"
}

variable "rds_engine_version" {
  type        = string
  description = "Database engine version for the RDS instance"
}

variable "rds_engine_family" {
  type        = string
  description = "Database engine family for the RDS instance"
}

variable "rds_major_engine_version" {
  type        = string
  description = "Major database engine version for the RDS instance"
}

variable "rds_db_instance_type" {
  type        = string
  description = "Instance type for the RDS instance"
}

variable "rds_db_name" {
  type        = string
  description = "Name of the RDS database"
}

variable "rds_db_username" {
  type        = string
  description = "Username for the RDS database"
}

variable "rds_db_password" {
  type        = string
  description = "Password for the RDS database"
}

variable "rds_sg_name" {
  type        = string
  description = "Name of the security group for the RDS instance"
}

variable "allocated_storage_size" {
  type        = number
  description = "Size of allocated storage for the RDS instance (in GB)"
}

variable "max_allocated_storage_size" {
  type        = number
  description = "Maximum allocated storage size for the RDS instance (in GB)"
}

variable "manage_master_user_password" {
  type        = bool
  description = "Flag to indicate whether to manage the master user password for the RDS instance"
}

variable "rds_db_port" {
  type        = number
  description = "Port on which the RDS instance will listen"
}

variable "multi_az" {
  type        = bool
  description = "Enable Multi-AZ deployment for high availability"
}

variable "deletion_protection" {
  type        = bool
  description = "Enable deletion protection for the RDS instance"
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Skip creating a final snapshot before deleting the RDS instance"
}

# variable "eks_security_group_id" {
#   type        = string
#   description = "Security group ID for the Amazon EKS cluster"
# }

variable "tags" {
  type        = map(string)
  description = "Tags to associate with the resources"
}

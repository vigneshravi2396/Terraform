variable "ecs_cluster_name" {
   description = "Name for ecs cluster creation"  
}

variable "ecs_cluster_capacity_provider" {
    description = "Name for the ecs cluster capacity provider" 
}


# variable "subnet_ids" {
#   description = "public subnet ids"
# }

variable "region" {
  type        = string
  description = "Name of the Region"
}
# # VPC Configuration
# variable "vpc-name" {
#   type        = string
#   description = "Name of the VPC"
# }

# variable "cidr-block" {
#   type        = string
#   description = "CIDR block for the VPC"
# }

# variable "private-subnet" {
#   type        = list(string)
#   description = "List of private subnet CIDR blocks"
# }

# variable "public-subnet" {
#   type        = list(string)
#   description = "List of public subnet CIDR blocks"
# }

# variable "db-subnet" {
#   type        = list(string)
#   description = "List of DB subnet CIDR blocks"
# }

variable "vpc_id" {
  type = string
}

# variable "vpc-subnetids" {
#   type        = list(string)
#   description = "List of subnet IDs where the ElastiCache Redis cluster will be deployed"
# }

variable "vpc_sg" {
  type = string
}

variable "vpc_subnet" {
  type = list(string)
  
}

#taskdifination eurka-service variable 
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
#taskdifination payment-service variable 
variable "ecs_name_payment" {
  type = string 
}
variable "ecs_image_payment" {
  type = string
}
#taskdifination program-service variable 
variable "ecs_name_program" {
  type = string 
}
variable "ecs_image_program" {
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
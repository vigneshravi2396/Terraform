# Variable to determine whether to destroy associated resources before deleting the VPC
variable "destroy_resources" {
  description = "Set to true to destroy associated resources before deleting the VPC"
  default     = false
}

# Retrieve available AWS availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Create VPC using the terraform-aws-modules VPC module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"


  # VPC Basic Details
  name            = var.vpc-name
  cidr            = var.cidrblock
  azs             = data.aws_availability_zones.available.names
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  # Database Subnets
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = var.database_private_subnets
  create_database_nat_gateway_route  = true

  # # NAT Gateways - Outbound Communication
  # enable_nat_gateway = true
  # single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true



  database_subnet_tags = {
    Type = "CICD-database-subnets"
  }
  tags = var.tags
  vpc_tags = {
    Name = var.vpc-name
  }
}

#security group
resource "aws_security_group" "sg" {
  name        = var.security_group_name
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 8084
    to_port          = 8084
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

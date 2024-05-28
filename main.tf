
# Define local variables used throughout the Terraform configuration.
locals {

  env              = var.env              # The environment label used for tagging resources.
  # Common tags applied to AWS resources to identify the environment.
  common_tags = {
    env = "test-${local.env}"
  }
}


# Module for creating a custom VPC
module "customvpc" {
  source                   = "./vpc"
  vpc-name                 = var.vpc-name
  cidrblock                = var.cidr-block
  vpc_private_subnets      = var.private-subnet
  vpc_public_subnets       = var.public-subnet
  database_private_subnets = var.db-subnet
  tags                     = local.common_tags
  security_group_name      = var.security_group_name

}

# Module for creating Amazon Elastic Container Registry (ECR)
module "ECR" {
  source    = "./ECR"
  ecr_names = var.ecr_names
  tags      = local.common_tags
}

# # # Module for creating AWS Secrets Manager secrets
module "secret-manager" {
  source  = "./secret-manager"
  length  = var.length
  special = var.special
  name    = var.name
  tags    = local.common_tags
}

# Module for creating Amazon RDS (Relational Database Service)
module "rds" {
  source                      = "./RDS"
  db_subnet_group_name        = module.customvpc.database_subnet_group_name
  vpcid                       = module.customvpc.vpcid
  rds_identifier              = var.rds_identifier
  rds_engine                  = var.rds_engine
  rds_engine_version          = var.rds_engine_version
  rds_engine_family           = var.rds_engine_family
  rds_major_engine_version    = var.rds_major_engine_version
  rds_db_instance_type        = var.rds_db_instance_type
  rds_db_name                 = var.rds_db_name
  rds_db_username             = module.secret-manager.db_creds.username
  rds_db_password             = module.secret-manager.db_creds.password
  rds_sg_name                 = var.rds_sg_name
  allocated_storage_size      = var.allocated_storage_size
  max_allocated_storage_size  = var.max_allocated_storage_size
  manage_master_user_password = var.manage_master_user_password
  rds_db_port                 = var.rds_db_port
  multi_az                    = var.multi_az
  deletion_protection         = var.deletion_protection
  skip_final_snapshot         = var.skip_final_snapshot
  tags                        = local.common_tags
}


# # Module for creating Amazon ElastiCache for Redis
module "redis" {
  source                     = "./Redis"
  depends_on                 = [module.customvpc]
  redis_subnet_group_name    = var.redis_subnet_group_name
  vpc-subnetids              = module.customvpc.private_subnets
  redis_cluster_name         = var.redis_cluster_name
  redis_engine               = var.redis_engine
  redis_node_type            = var.redis_node_type
  cache_node                 = var.cache_node
  redis_parameter_group_name = var.redis_parameter_group_name
  redis_engine_version       = var.redis_engine_version
  redis_sg_name              = var.redis_sg_name
  vpc_id                     = module.customvpc.vpcid
  tags                       = local.common_tags
}

# Module for creating Amazon ECS
module "ECS" {
  source                        = "./ECS"
  ecs_cluster_name              = var.ecs_cluster_name
  ecs_cluster_capacity_provider = var.ecs_cluster_name
  region                        = "us-east-1" 
  vpc_id                        = module.customvpc.vpcid
  vpc_sg                        = module.customvpc.vpc-sg
  vpc_subnet                    = module.customvpc.public_subnets
  #eureka taskdefination
  ecs_name_eureka                      = var.ecs_name_eureka
  ecs_image_eureka                     = var.ecs_image_eureka
  #gatway taskdefination
  ecs_name_gatway                      = var.ecs_name_gatway
  ecs_image_gatway                     = var.ecs_image_gatway
  #user taskdefination
  ecs_name_user                        = var.ecs_name_user
  ecs_image_user                       = var.ecs_image_user
  #auth taskdefination
  ecs_name_auth                        = var.ecs_name_auth
  ecs_image_auth                       = var.ecs_image_auth
  #payment taskdefination
  ecs_name_payment                     = var.ecs_name_payment
  ecs_image_payment                    = var.ecs_image_payment
  #progrm taskdefination
  ecs_name_program                     = var.ecs_name_program
  ecs_image_program                    = var.ecs_image_program
  #notification taskdefination
  ecs_name_notify                      = var.ecs_name_notify
  ecs_image_notify                     = var.ecs_image_notify
  #falskapp taskdefination
  ecs_name_flask                       = var.ecs_name_flask
  ecs_image_flask                      = var.ecs_image_flask
}






env    = "DEV"
region = "us-east-1"

# # ############################################ RDS ################################################

rds_identifier              = "devlop"
rds_engine                  = "postgres"
rds_engine_version          = "14.9"
rds_engine_family           = "postgres14"
rds_major_engine_version    = "14"
rds_db_instance_type        = "db.t3.large"
rds_db_name                 = "postgres"
rds_sg_name                 = "rds-sg"
allocated_storage_size      = 30
max_allocated_storage_size  = 100
manage_master_user_password = "false"
rds_db_port                 = 5432
multi_az                    = "false"
deletion_protection         = "false"
skip_final_snapshot         = "false"


# # ############################################# Redis #############################################

redis_subnet_group_name    = "expert9-redis-subnet"
redis_cluster_name         = "expert-devlop"
redis_engine               = "redis"
redis_node_type            = "cache.t3.medium"
cache_node                 = 1
redis_parameter_group_name = "default.redis7"
redis_engine_version       = "7.0"
redis_sg_name              = "expert9-redis-sg"

# # ############################################ Secret-Manager ######################################

length  = "16"
special = "false"
name    = "expertsecretmanagerr"

# # ############################################# VPC ################################################

vpc-name       = "expert-vpc"
cidr-block     = "192.168.1.0/24"
private-subnet = ["192.168.1.0/28", "192.168.1.16/28"]
public-subnet  = ["192.168.1.32/28", "192.168.1.48/28"]
db-subnet      = ["192.168.1.64/28", "192.168.1.80/28"]
security_group_name = "expert-sg"



# # ############################### KEY PAIR ##########################################
rsa_key_name  = "africa-uat-key-pair"
key_pair_name = "key-pair.pem"

# # ############################# ECR Repository #####################################
ecr_names = ["auth-service", "eureka-server", "expert9-flask-app", "gateway-service", "notification-service", "payment-services", "program-service", "user-service"]

# ##################################### ECS #########################################################
ecs_cluster_name = "devlop"
ecs_cluster_capacity_provider = "demo_cp"
# subnet_ids = "subnet-00aecafdcd5ea75a0,subnet-0a5ad5444e630a208"
# eureka-server taskdefnation
ecs_name_eureka  = "eureka-server"
ecs_image_eureka = "339712741355.dkr.ecr.us-east-1.amazonaws.com/eureka-server:latest" #179438333696
# gatway taskdefnation
ecs_name_gatway  = "gatway-service"
ecs_image_gatway = "339712741355.dkr.ecr.us-east-1.amazonaws.com/gateway-service:latest"
# user taskdefnation
ecs_name_user  = "user-service"
ecs_image_user = "339712741355.dkr.ecr.us-east-1.amazonaws.com/user-service:latest"
# auth taskdefnation
ecs_name_auth  = "auth-service"
ecs_image_auth = "339712741355.dkr.ecr.us-east-1.amazonaws.com/auth-service:latest"
# payment taskdefnation
ecs_name_payment  = "payment-services"
ecs_image_payment = "339712741355.dkr.ecr.us-east-1.amazonaws.com/payment-services:latest"
# program taskdefnation
ecs_name_program  = "program-service"
ecs_image_program = "339712741355.dkr.ecr.us-east-1.amazonaws.com/program-service:latest"
# notify taskdefnation
ecs_name_notify  = "notification-service"
ecs_image_notify = "339712741355.dkr.ecr.us-east-1.amazonaws.com/notification-service:latest"
# flask-taskdefnation
ecs_name_flask  = "expert9-flask-app"
ecs_image_flask = "339712741355.dkr.ecr.us-east-1.amazonaws.com/expert9-flask-app:latest"
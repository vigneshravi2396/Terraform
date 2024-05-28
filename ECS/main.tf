# create cluster ECS  
resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name    
}
resource "aws_ecs_cluster_capacity_providers" "cluster_cp" {
  cluster_name = var.ecs_cluster_name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}
###################################################################################################

#create task definition "service-discovery"
resource "aws_ecs_task_definition" "eureka-server" {
  family                   = "eureka-server"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn 
  cpu                      = 256
  memory                   = 512
  container_definitions    = jsonencode([
    {
      name            = var.ecs_name_eureka
      image           = var.ecs_image_eureka
      essential       = true
      portMappings    = [
        {
          containerPort = 8761
          hostPort      = 8761
          protocol      = "tcp"
        } 
      ],
      environment     = [
        {
          name  = "DATABASE_NAME"            # Name of the environment variable
          value = "experta_devops"           # Value of the environment variable
        },
        {
          name  = "DATABASE_PASSWORD"
          value = "*****"                    #password manually
        },
        {
          name  = "DATABASE_URL"
          value = "******"                   #DB Endpoint
          
        },
        {
          name  = "DATABASE_USERNAME"
          value = "postgres"
        },
        {
          name  = "REDIS_HOST"
          value = "******"                   #Redis Endponit
        },
        {
          name  = "REDIS_PORT"
          value = "6379" 
        }
        # Add more environment variables as needed
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/eureka-server"  # CloudWatch Logs group
          "awslogs-region"        = "us-east-1"           # AWS region
          "awslogs-stream-prefix" = "ecs"                 # Log stream prefix
        }
      }
    }     
  ])
}

resource "aws_ecs_task_definition" "gateway_service" {
  family                   = "gateway-service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn 
  cpu                      = 256
  memory                   = 512
  container_definitions    = jsonencode([
    {
      name            = var.ecs_name_gatway
      image           = var.ecs_image_gatway
      essential       = true
      portMappings    = [
        {
          containerPort = 80  # Example port for the gateway service
          hostPort      = 80  # Example host port, adjust as needed
          protocol      = "tcp"
        } 
      
      ],
      environment     = [
        {
          name  = "DATABASE_NAME"            # Name of the environment variable
          value = "experta_devops"           # Value of the environment variable
        },
        {
          name  = "DATABASE_PASSWORD"        #password manually
          value = "*****"
        },
        {
          name  = "DATABASE_URL"             #DB Endpoint
          value = "*****"
          
        },
        {
          name  = "DATABASE_USERNAME"
          value = "postgres"
        },
        {                               
          name  = "REDIS_HOST"               #Redis Endponit
          value = "*****"
        },
        {
          name  = "REDIS_PORT"
          value = "6379" 
        },
        # Add more environment variables as needed
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/gateway-service"  # CloudWatch Logs group
          "awslogs-region"        = "us-east-1"             # AWS region
          "awslogs-stream-prefix" = "ecs"                   # Log stream prefix
        }
      }
    }     
  ])
}

resource "aws_ecs_task_definition" "user_service" {
  family                   = "user-service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn 
  cpu                      = 256
  memory                   = 512
  container_definitions    = jsonencode([
    {
      name            = var.ecs_name_user
      image           = var.ecs_name_user
      essential       = true
      portMappings    = [
        {
          containerPort = 8085  # Example port for the user service
          hostPort      = 8085  # Example host port, adjust as needed
          protocol      = "tcp"
        } 
      ],
      environment     = [
        {
          name  = "DATABASE_NAME"            # Name of the environment variable
          value = "experta_devops"           # Value of the environment variable
        },
        {
          name  = "DATABASE_PASSWORD"        #password manually
          value = "*****"
        },
        {
          name  = "DATABASE_URL"             #DB Endpoint
          value = "*****"
          
        },
        {
          name  = "DATABASE_USERNAME"
          value = "postgres"
        },
        {
          name  = "REDIS_HOST"               #Redis Endpoint
          value = "*****"
        },
        {
          name  = "REDIS_PORT"
          value = "6379" 
        },
        # Add more environment variables as needed
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/user-service"  # CloudWatch Logs group
          "awslogs-region"        = "us-east-1"          # AWS region
          "awslogs-stream-prefix" = "ecs"                # Log stream prefix
        }
      }
    }     
  ])
}

resource "aws_ecs_task_definition" "authservice" {
  family                   = "authservice"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn 
  cpu                      = 256
  memory                   = 512
  container_definitions    = jsonencode([
    {
      name            = var.ecs_name_auth
      image           = var.ecs_name_auth
      essential       = true
      portMappings    = [
        {
          containerPort = 8089  # Example port for the user service
          hostPort      = 8089  # Example host port, adjust as needed
          protocol      = "tcp"
        } 
      ],
      environment     = [
        {
          name  = "DATABASE_NAME"            # Name of the environment variable
          value = "experta_devops"           # Value of the environment variable
        },
        {
          name  = "DATABASE_PASSWORD"        #password manully
          value = "*****"
        },
        {
          name  = "DATABASE_URL"             #DB Endpoint
          value = "*****"
          
        },
        {
          name  = "DATABASE_USERNAME"
          value = "postgres"
        },
        {
          name  = "REDIS_HOST"              #Redis Endpoint
          value = "*****"
        },
        {
          name  = "REDIS_PORT"
          value = "6379" 
        },
        # Add more environment variables as needed
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/auth-service"  # CloudWatch Logs group
          "awslogs-region"        = "us-east-1"          # AWS region
          "awslogs-stream-prefix" = "ecs"                # Log stream prefix
        }
      }
    }     
  ])
}

resource "aws_ecs_task_definition" "payment-services" {
  family                   = "payment-services"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn 
  cpu                      = 256
  memory                   = 512
  container_definitions    = jsonencode([
    {
      name            = var.ecs_name_payment
      image           = var.ecs_name_payment
      essential       = true
      portMappings    = [
        {
          containerPort = 8894  # Example port for the user service
          hostPort      = 8894  # Example host port, adjust as needed
          protocol      = "tcp"
        } 
      ],
      environment     = [
        {
          name  = "DATABASE_NAME"            # Name of the environment variable
          value = "experta_devops"           # Value of the environment variable
        },
        {
          name  = "DATABASE_PASSWORD"        #password manually 
          value = "*****"
        },
        {
          name  = "DATABASE_URL"             #DB Endpoint
          value = "*****"
          
        },
        {
          name  = "DATABASE_USERNAME"
          value = "postgres"
        },
        {
          name  = "REDIS_HOST"               #Redis Endpoint
          value = "*****"
        },
        {
          name  = "REDIS_PORT"
          value = "6379" 
        },
        # Add more environment variables as needed
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/payment-services"  # CloudWatch Logs group
          "awslogs-region"        = "us-east-1"              # AWS region
          "awslogs-stream-prefix" = "ecs"                    # Log stream prefix
        }
      }
    }     
  ])
}

resource "aws_ecs_task_definition" "program-service" {
  family                   = "program-service"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn 
  cpu                      = 256
  memory                   = 512
  container_definitions    = jsonencode([
    {
      name            = var.ecs_name_auth
      image           = var.ecs_name_auth
      essential       = true
      portMappings    = [
        {
          containerPort = 8896  # Example port for the user service
          hostPort      = 8896  # Example host port, adjust as needed
          protocol      = "tcp"
        } 
      ],
      environment     = [
        {
          name  = "DATABASE_NAME"            # Name of the environment variable
          value = "experta_devops"           # Value of the environment variable
        },
        {       
          name  = "DATABASE_PASSWORD"        #password manully
          value = "*****"
        },
        {  
          name  = "DATABASE_URL"             #DB Endpoint
          value = "*****"
          
        },
        {
          name  = "DATABASE_USERNAME"
          value = "postgres"
        },
        {
          name  = "REDIS_HOST"              #Redis Endpoint
          value = "*****"
        },
        {
          name  = "REDIS_PORT"
          value = "6379" 
        },
        # Add more environment variables as needed
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/program-service"  # CloudWatch Logs group
          "awslogs-region"        = "us-east-1"          # AWS region
          "awslogs-stream-prefix" = "ecs"                # Log stream prefix
        }
      }
    }     
  ])
}
resource "aws_ecs_task_definition" "notificationservice" {
  family                   = "notificationservice"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn 
  cpu                      = 256
  memory                   = 512
  container_definitions    = jsonencode([
    {
      name            = var.ecs_name_notify
      image           = var.ecs_name_notify
      essential       = true
      portMappings    = [
        {
          containerPort = 3000  # Example port for the user service
          hostPort      = 3000  # Example host port, adjust as needed
          protocol      = "tcp"
        } 
      ],
      environment     = [
        {
          name  = "API_BASE"                        # Name of the environment variable
          value = "http://localhost:3000"           # Value of the environment variable
        },
        {
          name  = "API_SCHEMA_HOST"
          value = "http://localhost:3000"
        },
        {
          name  = "APP_URL"
          value = "https://app.ex9.ai"
          
        },
        {
          name  = "AWS_SES_KEY"               
          value = "******"                  #Access key
        },
        {
          name  = "AWS_SES_REGION"
          value = "us-east-1"
        },
        {
          name  = "AWS_SES_SECRET"
          value = "******"                  #Secret Key
        },
        {
          name  = "AWS_SQS_KEY"
          value = "*****"                   #Access Key
        },
        {
          name  = "AWS_SQS_REGION"
          value = "us-east-1"
        },
        {
          name  = "AWS_SQS_SECRET"
          value = "*****"                   #Secret Key
        },
        {
          name  = "BLOCKLIST_API_LOG"
          value = "[]"
        },
        {
          name  = "CONV_FETCH_LIMIT"
          value = "50"
        },
        {
          name  = "DB_DATABASE"
          value = "experta_prod"
        },
        {
          name  = "DB_HOST"
          value = "*****"                   #DB Endpoint
        },
        {
          name  = "DB_PASSWORD"
          value = "*****"                   #DB password 
        },
        {
          name  = "DB_PORT"
          value = "5432"
        },
        {
          name  = "DB_USERNAME"
          value = "postgres"
        },
        {
          name  = "ENABLE_API_LOG"
          value = "true"
        },
        {
          name  = "ENABLE_GENERAL_LOG"
          value = "true"
        },
        {
          name  = "ENVIRONMENT"
          value = "dev"
        },
        {
          name  = "GENERAL_LOG_FILE_NAME"
          value = "nb_general"
        },

        {
          name  = "GOOGLEAPI_CLIENT_ID"
          value = "639880247720-02f5nu35hrcptdg6sh6kar6ql6db2c77.apps.googleusercontent.com"
        },
        {
          name  = "HOST_PORT"
          value = "3000"
        },
        {
          name  = "JWT_SECRET"
          value = "5b2cf08ec74e946e0272d9d26572bcd16a934c58"
        },
        {
          name  = "LINKEDIN_CLIENT_ID"
          value = "8663w9eg4dfquy"
        },
        {
          name  = "LINKEDIN_CLIENT_SECRET"
          value = "WqGFd8TB8Xr83dj2"
        },
        {
          name  = "MAX_LOG_FILES"
          value = "14d"
        },
        {
          name  = "MICROSOFT_CLIENT_ID"
          value = "e4c6fb31-97ad-4984-afa5-ff9608bfd0f3"
        },
        {
          name  = "MICROSOFT_CLIENT_SECRET"
          value = "aor8Q~G9yKK6uwMo2Db-nep6MEWQAGf-uMdpScKU"
        },
        {
          name  = "NODE_ENV"
          value = "dev"
        },
        {
          name  = "SESSION_EXPIRES"
          value = "86400"
        },
        {
          name  = "SES_DEFAULT_SENDER"
          value = "contact@ex9.ai"
        },
        {
          name  = "SQS_QUEUE_URL"
          value = "******"                         #SQS Endpoint
        }, 

        # Add more environment variables as needed
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/notificationservice"  # CloudWatch Logs group
          "awslogs-region"        = "us-east-1"                 # AWS region
          "awslogs-stream-prefix" = "ecs"                       # Log stream prefix
        }
      }
    }     
  ])
}

resource "aws_ecs_task_definition" "expert-flask-app" {
  family                   = "expert-flask-app"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn 
  cpu                      = 256
  memory                   = 512
  container_definitions    = jsonencode([
    {
      name            = var.ecs_name_flask
      image           = var.ecs_name_flask
      essential       = true
      portMappings    = [
        {
          containerPort = 5000  # Example port for the user service
          hostPort      = 5000  # Example host port, adjust as needed
          protocol      = "tcp"
        } 
      ],
      environment     = [
        {
          name  = "DATABASE_NAME"            # Name of the environment variable
          value = "experta_devops"           # Value of the environment variable
        },
        # Add more environment variables as needed
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/flask-app"     # CloudWatch Logs group
          "awslogs-region"        = "us-east-1"          # AWS region
          "awslogs-stream-prefix" = "ecs"                # Log stream prefix
        }
      }
    }     
  ])
}

###################################################################################################
#create load balancer attach gatway-service
resource "aws_lb" "ecs_alb" {
  name               = "experat-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.vpc_sg]    #["sg-0143cbb03b389b1de"]
  subnets            = var.vpc_subnet
}

resource "aws_lb_listener" "ecs_alb_listener" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_tg.arn
  }
}

# resource "aws_lb_listener" "ecs_alb_listener_https" {
#   load_balancer_arn = aws_lb.ecs_alb.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.ecs_tg.arn
#   }
# }

resource "aws_lb_target_group" "ecs_tg" {
  name        = "ecs-target-group"
  port        = 8084
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path = "/hello"
  }
}
##########################################################################################
#create service-discovery - eurka-service
resource "aws_service_discovery_private_dns_namespace" "ecs_namespace" {
  name               = "discovery"
  vpc                = var.vpc_id
}

resource "aws_service_discovery_service" "eureka_service" {
  name               = "eureka-service"
  namespace_id       = aws_service_discovery_private_dns_namespace.ecs_namespace.id
  dns_config {
    namespace_id     = aws_service_discovery_private_dns_namespace.ecs_namespace.id
    dns_records {
      ttl            = 15
      type           = "A"
    }
  }
}
####################################################################################
#create eureka_service
resource "aws_ecs_service" "eureka_service" {
  name            = "eureka-service"
  cluster         = aws_ecs_cluster.ecs_cluster.arn
  task_definition = aws_ecs_task_definition.eureka-server.arn
  desired_count   = 1

  network_configuration {
    security_groups    = [var.vpc_sg]
    subnets            = var.vpc_subnet
    assign_public_ip   = true  # Eureka service doesn't need a public IP
  }

  service_registries {
    registry_arn = aws_service_discovery_service.eureka_service.arn
  }
}

#create gateway_service
resource "aws_ecs_service" "gateway_service" {
  name            = "gateway-service"
  cluster         = aws_ecs_cluster.ecs_cluster.arn
  task_definition = aws_ecs_task_definition.gateway_service.arn
  desired_count   = 1

  network_configuration {
    security_groups    = [var.vpc_sg]
    subnets            = var.vpc_subnet
    assign_public_ip   = true  # Gateway service should have a public IP
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_tg.arn
    container_name   = "gatway-service"  # Corrected container name to match the task definition
    container_port   = 80
  }
}

#create user_service
resource "aws_ecs_service" "user_service" {
  name            = "user-service"
  cluster         = aws_ecs_cluster.ecs_cluster.arn
  task_definition = aws_ecs_task_definition.user_service.arn
  desired_count   = 1

  network_configuration {
    security_groups    = [var.vpc_sg]
    subnets            = var.vpc_subnet
    assign_public_ip   = true  
  }
}

#create auth_service
resource "aws_ecs_service" "auth_service" {
  name            = "auth-service"
  cluster         = aws_ecs_cluster.ecs_cluster.arn
  task_definition = aws_ecs_task_definition.authservice.arn
  desired_count   = 1

  network_configuration {
    security_groups    = [var.vpc_sg]
    subnets            = var.vpc_subnet
    assign_public_ip   = true  
  }
}

#create payment_service
resource "aws_ecs_service" "payment_services" {
  name            = "payment-services"
  cluster         = aws_ecs_cluster.ecs_cluster.arn
  task_definition = aws_ecs_task_definition.payment-services.arn
  desired_count   = 1

  network_configuration {
    security_groups    = [var.vpc_sg]
    subnets            = var.vpc_subnet
    assign_public_ip   = true  
  }
}


#create program_service
resource "aws_ecs_service" "program_service" {
  name            = "program-service"
  cluster         = aws_ecs_cluster.ecs_cluster.arn
  task_definition = aws_ecs_task_definition.program-service.arn
  desired_count   = 1

  network_configuration {
    security_groups    = [var.vpc_sg]
    subnets            = var.vpc_subnet
    assign_public_ip   = true  
  }
}

#create notification_service
resource "aws_ecs_service" "notification_service" {
  name            = "notification-service"
  cluster         = aws_ecs_cluster.ecs_cluster.arn
  task_definition = aws_ecs_task_definition.notificationservice.arn
  desired_count   = 1

  network_configuration {
    security_groups    = [var.vpc_sg]
    subnets            = var.vpc_subnet
    assign_public_ip   = true  
  }
}
resource "aws_ecs_service" "expert-flask-app" {
  name            = "expert-flask-app"
  cluster         = aws_ecs_cluster.ecs_cluster.arn
  task_definition = aws_ecs_task_definition.expert-flask-app.arn
  desired_count   = 1

  network_configuration {
    security_groups    = [var.vpc_sg]
    subnets            = var.vpc_subnet
    assign_public_ip   = true  
  }
}
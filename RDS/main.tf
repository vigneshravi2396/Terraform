# Create an RDS database instance using the terraform-aws-modules/rds/aws module
module "db" {
  source                      = "terraform-aws-modules/rds/aws"
  version                     = "6.1.1"
  # depends_on                  = [aws_security_group.rds-sg]
  identifier                  = var.rds_identifier
  engine                      = var.rds_engine
  engine_version              = var.rds_engine_version
  family                      = var.rds_engine_family
  major_engine_version        = var.rds_major_engine_version
  instance_class              = var.rds_db_instance_type
  allocated_storage           = var.allocated_storage_size
  max_allocated_storage       = var.max_allocated_storage_size
  db_name                     = var.rds_db_name
  username                    = var.rds_db_username
  password                    = var.rds_db_password
  manage_master_user_password = var.manage_master_user_password
  port                        = var.rds_db_port
  multi_az                    = var.multi_az # production set to be true
  db_subnet_group_name        = var.db_subnet_group_name
  vpc_security_group_ids      = [aws_security_group.rds-sg.id]
  deletion_protection         = var.deletion_protection
  skip_final_snapshot         = var.skip_final_snapshot # production set to be true
  tags                        = var.tags
}

# # Create a security group for the RDS database instance
resource "aws_security_group" "rds-sg" {
  name   = var.rds_sg_name
  vpc_id = var.vpcid
  tags   = var.tags
  # Define inbound rules to allow traffic on port 5432 (PostgreSQL)
  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Define outbound rules to allow all outbound traffic
  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
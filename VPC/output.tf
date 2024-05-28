output "vpcid" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Private subnets for the EKS VPC."
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Public subnets for the EKS VPC."
  value       = module.vpc.public_subnets
}

output "database_subnet_group_name" {
  description = "RDS-DB-subnet-group"
  value       = module.vpc.database_subnet_group_name
}

output "vpc-sg" {
  value = aws_security_group.sg.id
}
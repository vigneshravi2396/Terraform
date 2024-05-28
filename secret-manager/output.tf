output "db_creds" {
  value       = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
  description = "Decoded database credentials obtained from AWS Secrets Manager"
}

output "SECRETARN" {
  value       = aws_secretsmanager_secret.secret_password.arn
  description = "ARN of the AWS Secrets Manager secret"
}

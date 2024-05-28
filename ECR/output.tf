output "ECR_ARN" {
  description = "The Amazon Resource Names (ARNs) of the created Amazon Elastic Container Registry (ECR) repositories."
  value       = aws_ecr_repository.ecr_repository.*.arn
}
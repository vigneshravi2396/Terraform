output "frontend_s3" {
  description = "ARN for the frontend-s3"
  value       = module.frontend.frontend_s3_arn
}

output "cloudfront-arn" {
  description = "ARN for cloudfront"
  value       = module.frontend.cloudfront-arn
}

output "bucket_id" {
  description = "The name of the frontend bucket"
  value       = module.frontend.bucket_id
}


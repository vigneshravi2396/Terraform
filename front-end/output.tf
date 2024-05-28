output "frontend_s3_arn" {
  description = "ARN for the Front-end S3"
  value       = aws_s3_bucket.bucket.arn
}

output "cloudfront-arn" {
  description = "ARN for cloudfront"
  value       = aws_cloudfront_distribution.cf_dist.arn
}

output "bucket_id" {
  description = "The name of the frontend bucket"
  value       = aws_s3_bucket.bucket.id
}

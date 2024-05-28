
#####################################################################################################
variable "frontend_bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "domain_name" {
  type        = string
  description = "The domain name to associate with the CloudFront distribution"
}

variable "frontEnd_cert_arn" {
  type        = string
  description = "The ARN (Amazon Resource Name) of the SSL certificate for HTTPS"
}

variable "default_root_object" {
  type        = string
  description = "The default object (e.g., 'index.html') to serve as the root of the website"
}

variable "env" {
  type        = string
  description = "The environment (e.g., 'dev', 'prod') where the infrastructure is deployed"
}

variable "region" {
  type        = string
  description = "The AWS region in which resources will be provisioned"
}

variable "cloudfront_oac_name" {
  type        = string
  description = "Name of the Cloudfront OAC"
}
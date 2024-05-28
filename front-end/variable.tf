variable "bucket_name" {
  type        = string
  description = "The prefix for the S3 bucket"
}

variable "domain_name" {
  type        = string
  description = "The domain name to use"
}

variable "tags" {
  type = map(string)
}

variable "frontEnd_cert_arn" {
  type        = string
  description = "The ARN (Amazon Resource Name) of the certificate used for HTTPS."
}

variable "default_root_object" {
  type        = string
  description = "The default root object for the CloudFront distribution."
}

variable "path" {
  default     = "/*"
  description = "The path to invalidate in the CloudFront distribution when changes occur."
}

variable "cloudfront_oac_name" {
  type        = string
  description = "Name of the Cloudfront OAC"
}
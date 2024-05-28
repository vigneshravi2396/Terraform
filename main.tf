# Define local variables used for common configuration.
locals {
  env = var.env # The environment label used for tagging resources.
  # Common tags applied to AWS resources to identify the environment.
  common_tags = {
    env = "CICD-MDTLabs-${local.env}"
  }
}

# Module for creating the frontend resources including S3 bucket and CloudFront distribution.
module "frontend" {
  source              = "./front-end"
  bucket_name         = var.frontend_bucket_name
  domain_name         = var.domain_name
  frontEnd_cert_arn   = var.frontEnd_cert_arn
  default_root_object = var.default_root_object
  cloudfront_oac_name = var.cloudfront_oac_name
  tags                = local.common_tags
}

#test

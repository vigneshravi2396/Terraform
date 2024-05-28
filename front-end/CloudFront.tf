# Define CloudFront Origin Access Control for S3. (Why OAC? ==> if we enable OAC, Users can able to access our bucket content only through cloudfront. Users can't access bucket directly, however we can push the data directly into the bucket.)
resource "aws_cloudfront_origin_access_control" "cloudfront_s3_oac" {
  name                              = var.cloudfront_oac_name
  description                       = "Cloud Front S3 OAC"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# Create CloudFront Distribution
resource "aws_cloudfront_distribution" "cf_dist" {
  enabled             = true
  aliases             = [var.domain_name]
  default_root_object = var.default_root_object

  origin {
    domain_name              = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id                = aws_s3_bucket.bucket.id
    origin_access_control_id = aws_cloudfront_origin_access_control.cloudfront_s3_oac.id
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_s3_bucket.bucket.id
    viewer_protocol_policy = "redirect-to-https" # other options - https only, http

    forwarded_values {
      headers      = []
      query_string = true
      cookies {
        forward = "all"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  custom_error_response {
   error_code    = 403
   response_code = 200
   response_page_path = "/index.html"
  }

  tags = var.tags
  viewer_certificate {
    #cloudfront_default_certificate = true
    acm_certificate_arn      = var.frontEnd_cert_arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2018"
  }
}

# Create a CloudFront invalidation upon changes
resource "null_resource" "create_argocd_folder" {
  depends_on = [aws_cloudfront_distribution.cf_dist]
  provisioner "local-exec" {
    command = "aws cloudfront create-invalidation --distribution-id ${aws_cloudfront_distribution.cf_dist.id} --paths ${var.path}"
  }
}

#    command = "aws cloudfront create-invalidation --distribution-id ${aws_cloudfront_distribution.cf_dist.id} --paths '/*'"



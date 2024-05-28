# Create an S3 bucket with the specified name and tags
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags   = var.tags
  #  force_destroy = true
}

# Configure ownership controls for the S3 bucket
resource "aws_s3_bucket_ownership_controls" "bucket_ownership_controls" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Set the ACL (Access Control List) of the S3 bucket to private
resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.bucket_ownership_controls]
  bucket     = aws_s3_bucket.bucket.id
  acl        = "private"
}


# Configure public access block settings for the S3 bucket
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}

# Enable server-side encryption for the S3 bucket using AES256 (SSE-S3)
resource "aws_s3_bucket_server_side_encryption_configuration" "encrypt" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Configure S3 bucket for website hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }
}

# # Attach an S3 bucket policy to control access
# resource "aws_s3_bucket_policy" "cdn-oac-bucket-policy" {
#   bucket = aws_s3_bucket.bucket.id
#   policy = data.aws_iam_policy_document.s3_bucket_policy.json
# }

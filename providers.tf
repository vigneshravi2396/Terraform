terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #      version = "5.17.0"  # Current versoin. If facing any issues with new version, rollout to current version.
      version = ">= 5.17.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# S3 backend resource
terraform {
  backend "s3" {
    encrypt = true
    bucket  = "terraform-state-expert"
    region  = "us-east-1"
    key     = "Front-End/terraform.tfstate"
    #    dynamodb_table = "terraform-state-lock-dynamo" # currently not using any statelocking. If multiple team members ruuing terraform, enable this option.
  }
}



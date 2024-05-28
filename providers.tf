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
    bucket  = "expert9-terraformtest"
    region  = "us-east-1"
    key     = "expert9/Back-End/terraform.tfstate"
    #    dynamodb_table = "terraform-state-lock-dynamo" # currently not using any statelocking. If multiple team members ruuing terraform, enable this option.
  }
}

# # Retrieve the output values from the FRONT_END and seamlessly transfer them as input to the BACK_END resource.
data "terraform_remote_state" "aws-resources" {
  backend = "s3"
  config = {
    bucket = "expert9-terraformtest"
    key    = "expert9/Back-End/terraform.tfstate"
    region = "us-east-1"
  }
 }


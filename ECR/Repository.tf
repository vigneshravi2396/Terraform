# Create Amazon Elastic Container Registry (ECR) repositories based on the ecr_names variable.
resource "aws_ecr_repository" "ecr_repository" {
  count                = length(var.ecr_names) # Create one repository for each name in the ecr_names list.
  name                 = var.ecr_names[count.index]
  image_tag_mutability = "MUTABLE"
  tags                 = var.tags

  # Configure image scanning settings for the repository.
  image_scanning_configuration {
    scan_on_push = false # Disable automatic scanning of images when pushed.
  }
}

# Create lifecycle policies for the ECR repositories.
resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policy" {
  count      = length(var.ecr_names)
  repository = aws_ecr_repository.ecr_repository[count.index].name

  # Define the JSON policy document that specifies image cleanup rules.
  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Remove image more than 5",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 5
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

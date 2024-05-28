# Firstly create a random generated password to use in secrets.
resource "random_password" "password" {
  length  = var.length
  special = var.special
}

# # Creating a AWS secret for database master account (Masteraccoundb)
resource "aws_secretsmanager_secret" "secret_password" {
  tags = var.tags
  name = var.name
}

# Creating a AWS secret versions for database master account (Masteraccoundb)
resource "aws_secretsmanager_secret_version" "sversion" {
  secret_id     = aws_secretsmanager_secret.secret_password.id
  secret_string = <<EOF
   {
    "username": "postgres",
    "password": "${random_password.password.result}"
   }
EOF
}  

# Importing the AWS secrets created previously using arn.
data "aws_secretsmanager_secret" "secret_password" {
  arn = aws_secretsmanager_secret.secret_password.arn
}

# Importing the AWS secret version created previously using arn.
data "aws_secretsmanager_secret_version" "creds" {
  secret_id = data.aws_secretsmanager_secret.secret_password.arn
}



# provider "aws" {
#   region = "us-east-1"
# }

# # To create my S3 bucket

# resource "aws_s3_bucket" "bucket" {
#     bucket = "bakare-terraform-state-backend"
#     versioning {
#         enabled = true
#     }
#     force_destroy = true
#     server_side_encryption_configuration {
#         rule {
#             apply_server_side_encryption_by_default {
#                 sse_algorithm = "AES256"
#             }
#         }
#     }
#     object_lock_configuration {
#         object_lock_enabled = "Enabled"
#     }
#     tags = {
#         Name = "bakare S3 Remote Terraform State Store"
#     }
# }

# To create DynamoDB

# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "bakare-terraform-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

# To Make S3 as backend
# terraform {
#   backend "s3" {
#     bucket         = "bakare-terraform-state-backend"
#     key            = "terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "bakare-terraform-locks"
#   }
# }
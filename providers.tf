terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
  #  access_key = var.access_key
  # secret_key = var.secret_key
}

# variable "access_key" {
#   default = terraform.workspace == "production" ? "" : var.access_key
# }

# variable "secret_key" {
#   default = terraform.workspace == "production" ? "" : var.secret_key
# }

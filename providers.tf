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
  access_key = "AKIA3XJ4ULPXJYPDBCEW"
  secret_key = "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"

}

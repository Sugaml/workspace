terraform {
  required_version = ">= 1.0"
  
  backend "s3" {  # Storing Terraform state remotely in S3
    bucket         = "your-terraform-state-bucket"
    key            = "rds-postgres/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"  # For state locking
  }
}

provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    bucket  = "sugam-terraform-state-bucket"
    key     = "ec2/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.aws_region
}

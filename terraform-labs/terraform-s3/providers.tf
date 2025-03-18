terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  alias  = "dev"
  region = var.aws_region

  profile = var.aws_profile_dev
}

provider "aws" {
  alias  = "prod"
  region = var.aws_region

  profile = var.aws_profile_prod
}

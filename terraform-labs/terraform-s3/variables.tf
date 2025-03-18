variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile_dev" {
  description = "AWS CLI profile for dev"
  type        = string
}

variable "aws_profile_prod" {
  description = "AWS CLI profile for prod"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

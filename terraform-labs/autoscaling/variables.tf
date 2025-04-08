variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "security_group_id" {
  description = "Security group ID for ALB and EC2 instances"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for ALB and ASG"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Key pair name for EC2 instances"
  type        = string
}

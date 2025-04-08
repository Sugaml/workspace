variable "subnet_ids" {
  description = "The subnet IDs for the Auto Scaling group"
  type        = list(string)
}

variable "target_group_arns" {
  description = "The ARNs of the target groups"
  type        = list(string)
}

variable "ami_id" {
  description = "The AMI ID used for EC2 instances"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "IAM Instance Profile Name for the EC2 instances"
  type        = string
}

variable "security_groups" {
  description = "Security groups for the Auto Scaling group instances"
  type        = list(string)
}

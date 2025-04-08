variable "name" {
    type = string
    default = "test-sg"
}

variable "vpc_id" {
    type = string
    default = ""
}

variable "enable_aws_lb" {
  type = bool
    default = false
}
variable "allocated_storage" { default = 20 }
variable "engine_version" { default = "15.3" }
variable "instance_class" { default = "db.t3.micro" }
variable "db_name" {}
variable "username" {}
variable "password" { sensitive = true }
variable "parameter_group_name" { default = "default.postgres15" }
variable "backup_retention_period" { default = 7 }
variable "allowed_cidr_blocks" { type = list(string) }

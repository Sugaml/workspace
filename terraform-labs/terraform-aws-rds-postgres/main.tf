# module "rds" {
#   source                 = "./modules/rds"
#   allocated_storage      = var.allocated_storage
#   engine_version         = var.engine_version
#   instance_class         = var.instance_class
#   db_name                = var.db_name
#   username               = var.username
#   password               = var.password
#   parameter_group_name   = var.parameter_group_name
#   backup_retention_period = var.backup_retention_period
#   allowed_cidr_blocks    = var.allowed_cidr_blocks
# }

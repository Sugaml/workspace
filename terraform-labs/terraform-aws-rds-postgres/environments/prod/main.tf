module "rds" {
  source                 = "../../modules/rds"
  allocated_storage      = 50
  engine_version         = "15.3"
  instance_class         = "db.t3.medium"
  db_name                = "proddb"
  username               = "admin"
  password               = "ProdStrongPass!"
  parameter_group_name   = "default.postgres15"
  backup_retention_period = 14
  allowed_cidr_blocks    = ["10.0.1.0/24"]
}

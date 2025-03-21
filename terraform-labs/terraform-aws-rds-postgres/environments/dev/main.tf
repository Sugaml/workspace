module "rds" {
  source                  = "../../modules/rds"
  allocated_storage       = 20
  engine_version          = "15.3"
  instance_class          = "db.t3.micro"
  db_name                 = "devdb"
  username                = "admin"
  password                = "DevStrongPass!"
  parameter_group_name    = "default.postgres15"
  backup_retention_period = 7
  allowed_cidr_blocks     = ["10.0.0.0/16"]
}

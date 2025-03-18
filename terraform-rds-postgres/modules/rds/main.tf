resource "aws_db_instance" "postgres" {
  identifier             = "postgres-rds-${random_string.suffix.result}"
  engine                = "postgres"
  engine_version        = "15.3"
  instance_class        = var.instance_class
  allocated_storage     = var.allocated_storage
  storage_encrypted     = true
  db_name               = var.db_name
  username             = var.db_username
  password             = var.db_password
  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name
  publicly_accessible    = false
  multi_az              = true
  backup_retention_period = 7
  deletion_protection   = true
  apply_immediately     = true
  parameter_group_name  = "default.postgres15"
  skip_final_snapshot   = false
  final_snapshot_identifier = "postgres-final-snapshot"

  tags = {
    Name = "Postgres RDS"
    Environment = "Production"
  }
}

resource "random_string" "suffix" {
  length  = 6
  special = false
}

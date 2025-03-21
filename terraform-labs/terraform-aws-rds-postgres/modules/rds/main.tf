resource "aws_db_instance" "postgres" {
  allocated_storage      = var.allocated_storage
  engine                = "postgres"
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  db_name               = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name  = var.parameter_group_name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible   = false
  skip_final_snapshot   = true
  backup_retention_period = var.backup_retention_period
  storage_encrypted     = true
  storage_type          = "gp2"
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Allow inbound traffic to RDS"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }
}

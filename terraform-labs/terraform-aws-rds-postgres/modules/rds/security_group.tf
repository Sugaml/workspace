resource "aws_security_group_rule" "rds_ingress" {
  type        = "ingress"
  from_port   = 5432
  to_port     = 5432
  protocol    = "tcp"
  security_group_id = aws_security_group.rds_sg.id
  cidr_blocks = var.allowed_cidr_blocks
}
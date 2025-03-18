output "rds_endpoint" {
  description = "RDS PostgreSQL endpoint"
  value       = module.rds.endpoint
}

output "rds_instance_id" {
  description = "RDS instance identifier"
  value       = module.rds.instance_id
}

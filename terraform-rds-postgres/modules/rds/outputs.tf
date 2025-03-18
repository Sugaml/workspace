output "rds_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = module.rds.endpoint
}

output "rds_instance_id" {
  description = "The ID of the RDS instance"
  value       = module.rds.instance_id
}

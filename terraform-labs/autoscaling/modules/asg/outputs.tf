output "auto_scaling_group_name" {
  description = "The name of the Auto Scaling Group"
  value       = aws_autoscaling_group.example.name
}

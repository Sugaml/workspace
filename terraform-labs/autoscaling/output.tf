output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.example.dns_name
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.asg.auto_scaling_group_name
}

output "target_group_arn" {
  description = "ARN of the Target Group"
  value       = aws_lb_target_group.example.arn
}

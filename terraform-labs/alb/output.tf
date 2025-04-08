output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.example.dns_name
}

output "aws_alb_arn" {
  description = "ARN of the ALB"
  value       =  aws_lb.this.arn
}


output "target_group_arn" {
  description = "ARN of the Target Group"
  value       = aws_lb_target_group.example.arn
}

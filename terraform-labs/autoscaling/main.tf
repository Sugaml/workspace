provider "aws" {
  region = var.region
}

# ALB - Application Load Balancer
resource "aws_lb" "example" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids
  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true
  idle_timeout  = 60
  
  tags = {
    Name = "my-alb"
  }
}

# Target Group
resource "aws_lb_target_group" "example" {
  name     = "my-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "my-tg"
  }
}

# Listener for ALB
resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.example.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      status_code = 200
      content_type = "text/plain"
      message_body = "OK"
    }
  }
}

# Scaling Policy
resource "aws_autoscaling_policy" "alb_request_count" {
  name                  = "scale-based-on-request-count"
  policy_type           = "TargetTrackingScaling"
  autoscaling_group_name = module.asg.auto_scaling_group_name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label         = "app/my-alb/12345678abcdef12/targetgroup/my-tg/abcdef12345678"
    }
    target_value          = 150
  }
}

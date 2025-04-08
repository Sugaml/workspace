provider "aws" {
  region = var.region
}

# Create an Application Load Balancer (ALB)
resource "aws_lb" "this" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids
  enable_deletion_protection = false
  enable_cross_zone_load_balancing = true
  idle_timeout  = 3600

  tags = {
    Name = "my-alb"
  }
}

# Create a Target Group
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

# Create a Listener for ALB (HTTP on port 80)
resource "aws_lb_listener" "example" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"
    default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.example.arn
  }
}

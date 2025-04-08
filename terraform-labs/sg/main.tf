resource "aws_security_group" "asg" {
  name = "sg_inst_${var.name}"
  description = "Security group for ${var.name} instances"
  vpc_id = var.vpc_id

  ingress = [
    {
        description = "All"
        from_port = 0  
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/8"]
        ipv6_cidr_blocks = null
        prefix_list_ids = null
        self = null
        security_groups = null
    },
    {
        description = "All"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/8"]
        ipv6_cidr_blocks = null
        prefix_list_ids = null
        self = null
        security_groups = null
    }
  ]
    egress = [
    {
        description = "All"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = null
        prefix_list_ids = null
        self = null
        security_groups = null
    }
  ]
}

resource "aws_security_group" "alb" {
    count = var.enable_aws_lb?1:0
    name = "sg_alb_${var.name}"
    description = "Security group for ${var.name} ALB"
    vpc_id = var.vpc_id

    ingress = [
        {
            description = "All HTTP"
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["10.0.0.0/0"]
            ipv6_cidr_blocks = null
            prefix_list_ids = null
            self = null
            security_groups = null
        },
         {
            description = "All HTTPS"
            from_port = 443
            to_port = 443
            protocol = "tcp"
            cidr_blocks = ["10.0.0.0/0"]
            ipv6_cidr_blocks = null
            prefix_list_ids = null
            self = null
            security_groups = null
        }
    ]
    egress = [
        {
            description = "All"
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = null
            prefix_list_ids = null
            self = null
            security_groups = null
        },
        {
            description = "All"
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["10.0.0.0/8"]
            ipv6_cidr_blocks = null
            prefix_list_ids = null
            self = null
            security_groups = null
        }
    ]
}

resource "aws_security_group" "alb_int" {
    count = var.enable_aws_lb?1:0
    name = "sg_alb_int_${var.name}"
    description = "Security group for ${var.name} INT ALB"
    vpc_id = var.vpc_id

    ingress = [
        {
            description = "All HTTP"
            from_port = 80
            to_port = 80
            protocol = "-1"
            cidr_blocks = ["10.0.0.0/8"]
            ipv6_cidr_blocks = null
            prefix_list_ids = null
            self = null
            security_groups = null
        },
         {
            description = "All HTTPS"
            from_port = 443
            to_port = 443
            protocol = "-1"
            cidr_blocks = ["10.0.0.0/8"]
            ipv6_cidr_blocks = null
            prefix_list_ids = null
            self = null
            security_groups = null
        }
    ]
    egress = [
        {
            description = "All"
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = null
            prefix_list_ids = null
            self = null
            security_groups = null
        }
    ]
}

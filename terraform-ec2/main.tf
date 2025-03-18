module "ec2" {
  source             = "./modules/ec2"
  instance_type      = var.instance_type
  key_name           = var.key_name
  security_group_ids = [module.security_group.security_group_id]
}

module "security_group" {
  source = "./modules/security-group"
}

module "infra" {
  source = "../../modules/network-ec2"

  project            = var.project
  environment        = var.environment
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
  instance_type      = var.instance_type
  ingress_cidrs      = var.ingress_cidrs
  tags               = var.tags
  aws_region         = var.aws_region
}

environment        = "dev"
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
aws_region         = "eu-west-3"
availability_zone  = "eu-west-3a"
instance_type      = "t2.micro"
ingress_cidrs      = ["0.0.0.0/0"]
tags = {
  Owner = "gangula"
}

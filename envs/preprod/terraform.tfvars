environment        = "preprod"
vpc_cidr           = "10.1.0.0/16"
public_subnet_cidr = "10.1.1.0/24"
aws_region         = "eu-west-3"
availability_zone  = "eu-west-3a"
instance_type      = "t3.small"
ingress_cidrs      = ["0.0.0.0/0"]
tags = {
  Owner = "gangula"
}

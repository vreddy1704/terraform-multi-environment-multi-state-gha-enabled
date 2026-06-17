environment        = "prod"
vpc_cidr           = "10.2.0.0/16"
public_subnet_cidr = "10.2.1.0/24"
aws_region         = "eu-central-1"
availability_zone  = "eu-central-1a"
instance_type      = "t3.medium"
ingress_cidrs      = ["0.0.0.0/0"]
tags = {
  Owner = "vivek"
}

variable "project" {
  type        = string
  default     = "demo"
  description = "Project name, used as a prefix for resource names and tags."
}

variable "environment" {
  type        = string
  description = "Environment name (dev, preprod, prod)."
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet."
}

variable "availability_zone" {
  type        = string
  description = "AZ for the public subnet, e.g. us-east-1a."
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "EC2 instance type."
}

variable "ingress_cidrs" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "CIDR blocks allowed to reach HTTP/HTTPS."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags merged into every resource."
}

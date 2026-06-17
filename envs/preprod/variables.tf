variable "aws_region" {
  type        = string
  description = "AWS region."
}

variable "project" {
  type        = string
  default     = "demo"
  description = "Project name."
}

variable "environment" {
  type        = string
  description = "Environment name."
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR."
}

variable "public_subnet_cidr" {
  type        = string
  description = "Public subnet CIDR."
}

variable "availability_zone" {
  type        = string
  description = "Availability zone."
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type."
}

variable "ingress_cidrs" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "Allowed ingress CIDRs for HTTP/HTTPS."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Extra tags."
}

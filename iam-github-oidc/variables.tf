variable "github_owner" {
  type        = string
  description = "GitHub username"
}

variable "github_repo" {
  type        = string
  description = "GitHub repository name"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.50.0"
    }
  }

  backend "s3" {
    bucket         = "gangula-17041991-rrn"
    key            = "envs/gha-dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "tfstate-lock-gangula"
  }
}

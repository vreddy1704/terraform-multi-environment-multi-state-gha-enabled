terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.50.0"
    }
  }
  # No backend block on purpose: bootstrap creates the very bucket and
  # lock table the other layers depend on, so it must run on LOCAL state.
}

provider "aws" {
  region = "us-east-1"
}

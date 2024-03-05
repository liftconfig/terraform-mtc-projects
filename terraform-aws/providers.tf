terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region

  assume_role {
    duration = "1h"
    role_arn = "arn:aws:iam::xxxxxxxxx:role/mtc-terraform"
  }
}
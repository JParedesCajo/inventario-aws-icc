terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region  = var.aws_region
  profile = "inventario-dev"
  default_tags {
    tags = {
      Project    = "inventario-aws-icc"
      Enviroment = "dev"
      ManagedBy  = "Terraform"
      Group      = "Grupo-05"
    }
  }
}
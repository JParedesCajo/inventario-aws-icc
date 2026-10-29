
provider "aws" {
  region  = var.aws_region
  default_tags {
    tags = {
      Project    = "inventario-aws-icc"
      Enviroment = "dev"
      ManagedBy  = "Terraform"
      Group      = "Grupo-05"
    }
  }
}
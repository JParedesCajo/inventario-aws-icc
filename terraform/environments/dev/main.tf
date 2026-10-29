# Creación de la red virtual principal del sistemna de inventario.
resource "aws_vpc" "inventario" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "inventario-vpc-dev"
  }
}
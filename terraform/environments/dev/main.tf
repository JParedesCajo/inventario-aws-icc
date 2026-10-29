# Creación de la red virtual principal del sistemna de inventario.
resource "aws_vpc" "inventario" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "inventario-vpc-dev"
  }
}

# Subred pública A ubicada en la primera zona de disponibilidad.
resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.inventario.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "inventario-public-a-dev"
    Tier = "public"
  }
}

# Subred pública B ubicada en la segunda zona de disponibilidad.
resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.inventario.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "inventario-public-b-dev"
    Tier = "public"
  }
}
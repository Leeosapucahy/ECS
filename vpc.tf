data "aws_vpc" "NaoProd" {
  id = var.vpc_id
}

resource "aws_subnet" "privatesubnet-sin-itau-1a"{
  vpc_id = "coloque aqui sua VPC"
  cidr_block              = cidrsubnet(data.aws_vpc.NaoProd.cidr_block, 8, 0) ## takes 10.0.0.0/16 --> 10.0.1.0/24
  map_public_ip_on_launch = true
  tags = {
    Name = "Coloque aqui o nome da Subnet"
  }
}

resource "aws_subnet" "privatesubnet-sin-itau-1b"{
  vpc_id = "coloque aqui sua VPC"
  cidr_block              = cidrsubnet(data.aws_vpc.NaoProd.cidr_block, 8, 5) ## takes 10.0.0.0/16 --> 10.0.1.0/24
  map_public_ip_on_launch = true
  tags = {
    Name = "coloque aqui o nome da Subnet"
  }
}

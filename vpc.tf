data "aws_vpc" "NaoProd" {
  id = var.vpc_id
}

resource "aws_subnet" "privatesubnet-sin-itau-1a"{
  vpc_id = ""
  cidr_block              = cidrsubnet(data.aws_vpc.NaoProd.cidr_block, 8, 0) ## takes 10.0.0.0/16 --> 10.0.1.0/24
  map_public_ip_on_launch = true
  tags = {
    Name = "privatesubnet-sin-itau-1a"
  }
}

resource "aws_subnet" "privatesubnet-sin-itau-1b"{
  vpc_id = ""
  cidr_block              = cidrsubnet(data.aws_vpc.NaoProd.cidr_block, 8, 5) ## takes 10.0.0.0/16 --> 10.0.1.0/24
  map_public_ip_on_launch = true
  tags = {
    Name = "privatesubnet-sin-itau-1b"
  }
}

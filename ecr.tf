resource "aws_ecr_repository" "repository_custodia" {
  name = "sin/custodia"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "repository_suprimentos" {
  name = "sin-itau/suprimentos"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "repository_coletas" {
  name = "sin-itau/coletas"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "repository_pedidos" {
  name = "sin/pedidos"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}
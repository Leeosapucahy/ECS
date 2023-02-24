############CREATING A ECS CLUSTER#############

data "aws_iam_role" "ecs_task_execution_role"{
  name = "ecsTaskExecutionRole"
}

resource "aws_ecs_cluster" "cluster" {
  name = "sin-itau-nprod"
}

resource "aws_ecs_task_definition" "custodia-dev" {
  family                   = "custodia-dev"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "custodia-dev",
      "image"     : "219347368657.dkr.ecr.us-east-1.amazonaws.com/sin/custodia:latestdev",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "custodia-dev" {
  name             = "custodia-dev"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.custodia-dev.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-sin-itau-1a.id,
      aws_subnet.privatesubnet-sin-itau-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "custodia-qa" {
  family                   = "custodia-qa"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "custodia-qa",
      "image"     : "219347368657.dkr.ecr.us-east-1.amazonaws.com/sin/custodia:latestqa",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "custodia-qa" {
  name             = "custodia-qa"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.custodia-qa.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-sin-itau-1a.id,
      aws_subnet.privatesubnet-sin-itau-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "custodia-hml" {
  family                   = "custodia-hml"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "custodia-hml",
      "image"     : "219347368657.dkr.ecr.us-east-1.amazonaws.com/sin/custodia:latesthml",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "custodia-hml" {
  name             = "custodia-hml"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.custodia-hml.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-sin-itau-1a.id,
      aws_subnet.privatesubnet-sin-itau-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}


resource "aws_ecs_task_definition" "suprimentos-dev" {
  family                   = "suprimentos-dev"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "suprimentos-dev",
      "image"     : "219347368657.dkr.ecr.us-east-1.amazonaws.com/sin-itau/suprimentos:latestdev",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "suprimentos-dev" {
  name             = "suprimentos-dev"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.suprimentos-dev.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-sin-itau-1a.id,
      aws_subnet.privatesubnet-sin-itau-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "suprimentos-qa" {
  family                   = "suprimentos-qa"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "suprimentos-qa",
      "image"     : "219347368657.dkr.ecr.us-east-1.amazonaws.com/sin-itau/suprimentos:latestqa",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "suprimentos-qa" {
  name             = "suprimentos-qa"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.suprimentos-qa.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-sin-itau-1a.id,
      aws_subnet.privatesubnet-sin-itau-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "suprimentos-hml" {
  family                   = "suprimentos-hml"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "suprimentos-hml",
      "image"     : "219347368657.dkr.ecr.us-east-1.amazonaws.com/sin-itau/suprimentos:latesthml",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "suprimentos-hml" {
  name             = "suprimentos-hml"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.suprimentos-hml.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-sin-itau-1a.id,
      aws_subnet.privatesubnet-sin-itau-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "coletas-dev" {
  family                   = "coletas-dev"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "coletas-dev",
      "image"     : "219347368657.dkr.ecr.us-east-1.amazonaws.com/sin-itau/coletas:latestdev",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "coletas-dev" {
  name             = "coletas-dev"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.coletas-dev.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-sin-itau-1a.id,
      aws_subnet.privatesubnet-sin-itau-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "coletas-qa" {
  family                   = "coletas-qa"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "coletas-qa",
      "image"     : "219347368657.dkr.ecr.us-east-1.amazonaws.com/sin-itau/coletas:latestqa",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "coletas-qa" {
  name             = "coletas-qa"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.coletas-qa.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-sin-itau-1a.id,
      aws_subnet.privatesubnet-sin-itau-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "coletas-hml" {
  family                   = "coletas-hml"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "coletas-hml",
      "image"     : "219347368657.dkr.ecr.us-east-1.amazonaws.com/sin-itau/coletas:latesthml",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}


resource "aws_ecs_service" "coletas-hml" {
  name             = "coletas-hml"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.coletas-hml.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-sin-itau-1a.id,
      aws_subnet.privatesubnet-sin-itau-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "pedidos-dev" {
  family                   = "pedidos-dev"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "pedidos-dev",
      "image"     : "219347368657.dkr.ecr.us-east-1.amazonaws.com/sin/pedidos:latestdev",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}


resource "aws_ecs_service" "pedidos-dev" {
  name             = "pedidos-dev"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.pedidos-dev.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-sin-itau-1a.id,
      aws_subnet.privatesubnet-sin-itau-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "pedidos-qa" {
  family                   = "pedidos-qa"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "pedidos-qa",
      "image"     : "219347368657.dkr.ecr.us-east-1.amazonaws.com/sin/pedidos:latestqa",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "pedidos-qa" {
  name             = "pedidos-qa"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.pedidos-qa.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-sin-itau-1a.id,
      aws_subnet.privatesubnet-sin-itau-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_ecs_task_definition" "pedidos-hml" {
  family                   = "pedidos-hml"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "pedidos-hml",
      "image"     : "219347368657.dkr.ecr.us-east-1.amazonaws.com/sin/pedidos:latesthml",
      "cpu"       : 256,
      "memory"    : 512,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "pedidos-hml" {
  name             = "pedidos-hml"
  cluster          = aws_ecs_cluster.cluster.id
  task_definition  = aws_ecs_task_definition.pedidos-hml.id
  desired_count    = 0
  launch_type      = "FARGATE"
  platform_version = "LATEST"

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.sg.id]
    subnets          = [
      aws_subnet.privatesubnet-sin-itau-1a.id,
      aws_subnet.privatesubnet-sin-itau-1b.id
      ]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}
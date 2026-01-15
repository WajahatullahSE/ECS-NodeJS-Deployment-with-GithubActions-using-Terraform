# CloudWatch Log Group for ECS logs
resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/ecs/${var.project_name}"
  retention_in_days = 7

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-log-group"
    }
  )
}

# ECS Cluster - Fargate only
resource "aws_ecs_cluster" "main" {
  name = "${var.project_name}-cluster"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-cluster"
    }
  )
}

# ECS Task Definition - Defines container configuration
resource "aws_ecs_task_definition" "main" {
  family                   = "${var.project_name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = var.ecs_task_execution_role_arn
  task_role_arn            = var.ecs_task_role_arn

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.ecr_image_uri
      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          protocol      = "tcp"
        }
      ]

      # CloudWatch Logs configuration
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs.name
          "awslogs-region"        = var.region
          "awslogs-stream-prefix" = "ecs"
        }
      }

      # Environment variables (add more as needed)
      environment = []
    }
  ])

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-task-definition"
    }
  )
}

# ECS Service - Manages task lifecycle and integrates with ALB
resource "aws_ecs_service" "main" {
  name            = "${var.project_name}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  # Network configuration - runs in private subnets
  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = [var.ecs_security_group_id]
    assign_public_ip = false
  }

  # Load balancer integration
  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  #depends_on = [var.alb_listener_arn]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-service"
    }
  )
}
# Common tags applied to all resources
locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

# VPC Module - Creates networking infrastructure
module "vpc" {
  source = "./modules/vpc"

  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags                 = local.common_tags
}

# Security Module - Creates security groups
module "security" {
  source = "./modules/security"

  project_name   = var.project_name
  vpc_id         = module.vpc.vpc_id
  container_port = var.container_port
  tags           = local.common_tags
}

# ALB Module - Creates load balancer and target group
module "alb" {
  source = "./modules/alb"

  project_name           = var.project_name
  vpc_id                 = module.vpc.vpc_id
  public_subnet_ids      = module.vpc.public_subnet_ids
  alb_security_group_id  = module.security.alb_security_group_id
  container_port         = var.container_port
  health_check_path      = var.health_check_path
  tags                   = local.common_tags
}

# ECS Module - Creates cluster, task definition, and service
module "ecs" {
  source = "./modules/ecs"

  project_name                = var.project_name
  region                      = var.region
  private_subnet_ids          = module.vpc.private_subnet_ids
  ecs_security_group_id       = module.security.ecs_tasks_security_group_id
  target_group_arn            = module.alb.target_group_arn
  alb_listener_arn            = module.alb.alb_listener_arn
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
  ecs_task_role_arn           = module.iam.ecs_task_role_arn
  ecr_image_uri               = var.ecr_image_uri
  container_name              = var.container_name
  container_port              = var.container_port
  task_cpu                    = var.task_cpu
  task_memory                 = var.task_memory
  desired_count               = var.desired_count
  tags                        = local.common_tags
}

# IAM Module - Creates roles for GitHub Actions and ECS
module "iam" {
  source = "./modules/iam"

  project_name       = var.project_name
  github_repo        = var.github_repo
  ecr_repository_arn = var.ecr_repository_arn
  ecs_service_arn    = module.ecs.ecs_service_arn
  tags               = local.common_tags
}
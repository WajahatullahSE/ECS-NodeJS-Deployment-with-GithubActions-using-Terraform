variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "ECS tasks security group ID"
  type        = string
}

variable "target_group_arn" {
  description = "ALB target group ARN"
  type        = string
}

variable "alb_listener_arn" {
  description = "ALB listener ARN"
  type        = string
}

variable "ecs_task_execution_role_arn" {
  description = "ECS task execution role ARN"
  type        = string
}

variable "ecs_task_role_arn" {
  description = "ECS task role ARN"
  type        = string
}

variable "ecr_image_uri" {
  description = "ECR image URI"
  type        = string
}

variable "container_name" {
  description = "Container name"
  type        = string
}

variable "container_port" {
  description = "Container port"
  type        = number
}

variable "task_cpu" {
  description = "Task CPU units"
  type        = string
}

variable "task_memory" {
  description = "Task memory in MB"
  type        = string
}

variable "desired_count" {
  description = "Desired number of tasks"
  type        = number
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}
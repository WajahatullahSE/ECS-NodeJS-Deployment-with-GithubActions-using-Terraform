variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "github_repo" {
  description = "GitHub repository in org/repo format"
  type        = string
}

variable "ecr_repository_arn" {
  description = "ECR repository ARN"
  type        = string
}

variable "ecs_service_arn" {
  description = "ECS service ARN"
  type        = string
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

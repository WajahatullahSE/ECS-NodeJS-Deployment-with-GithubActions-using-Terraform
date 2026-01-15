variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "container_port" {
  description = "Container port for the application"
  type        = number
}

variable "health_check_path" {
  description = "Health check path"
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

variable "github_repo" {
  description = "GitHub repository in org/repo format"
  type        = string
}

variable "ecr_repository_arn" {
  description = "ECR repository ARN"
  type        = string
}

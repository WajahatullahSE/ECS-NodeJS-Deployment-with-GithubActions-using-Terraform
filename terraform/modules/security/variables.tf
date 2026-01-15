variable "project_name" {
  description = "Project name prefix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "container_port" {
  description = "Container port for the application"
  type        = number
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

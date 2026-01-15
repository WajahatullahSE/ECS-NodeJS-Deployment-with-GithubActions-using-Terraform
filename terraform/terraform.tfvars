project_name = "wu-node-app"
environment  = "dev"
region       = "us-west-2"

# VPC Configuration
vpc_cidr             = "10.0.0.0/16"
availability_zones   = ["us-west-2a", "us-west-2b"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]

# Container Configuration
container_port     = 8081
container_name     = "wu-node-app-container"
health_check_path  = "/"
ecr_image_uri      = "504649076991.dkr.ecr.us-west-2.amazonaws.com/wu-repo/task13:latest"

# ECS Task Configuration
task_cpu      = "256"
task_memory   = "512"
desired_count = 2

# GitHub Configuration
github_repo = "WajahatullahSE/ECS-NodeJS-Deployment-with-GithubActions-using-Terraform"

# ECR Configuration
ecr_repository_arn = "arn:aws:ecr:us-west-2:504649076991:repository/wu-repo/task13"

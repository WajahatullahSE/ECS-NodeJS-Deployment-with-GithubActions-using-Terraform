output "alb_dns_name" {
  description = "ALB DNS name - Use this to access your application"
  value       = module.alb.alb_dns_name
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = module.ecs.ecs_cluster_id
}

output "ecs_service_name" {
  description = "ECS service name"
  value       = module.ecs.ecs_service_id
}

output "github_actions_role_arn" {
  description = "GitHub Actions IAM role ARN - Use this in your CI/CD workflow"
  value       = module.iam.github_actions_role_arn
}
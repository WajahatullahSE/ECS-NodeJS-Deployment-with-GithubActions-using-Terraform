output "ecs_cluster_id" {
  description = "ECS cluster ID"
  value       = aws_ecs_cluster.main.id
}

output "ecs_cluster_arn" {
  description = "ECS cluster ARN"
  value       = aws_ecs_cluster.main.arn
}

output "ecs_service_id" {
  description = "ECS service ID"
  value       = aws_ecs_service.main.id
}

output "ecs_service_arn" {
  description = "ECS service ARN"
  value       = aws_ecs_service.main.arn
}

output "ecs_task_definition_arn" {
  description = "ECS task definition ARN"
  value       = aws_ecs_task_definition.main.arn
}

output "plan_role_arn" {
  value       = aws_iam_role.plan.arn
  description = "Add as repo secret AWS_PLAN_ROLE_ARN (used by PR plans)."
}

output "apply_role_arn" {
  value       = aws_iam_role.apply.arn
  description = "Add as repo secret AWS_APPLY_ROLE_ARN (used by merge applies)."
}

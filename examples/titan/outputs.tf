output "custom_model_arn" {
  description = "The ARN of the output model."
  value       = module.model.custom_model_arn
}

output "job_arn" {
  description = "The ARN of the customization job."
  value       = module.model.job_arn
}

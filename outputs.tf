output "custom_model_arn" {
  description = "The ARN of the output model."
  value       = aws_bedrock_custom_model.this.custom_model_arn
}

output "job_arn" {
  description = "The ARN of the customization job."
  value       = aws_bedrock_custom_model.this.job_arn
}

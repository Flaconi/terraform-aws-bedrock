module "model" {
  source = "../../"

  name                = "titan"
  job_name            = "titan-job-1"
  foundation_model_id = "amazon.titan-text-express-v1"
  model_role_arn      = "arn:aws:iam::123456789101:role/TitanModelRole"

  model_hyperparameters = {
    "epochCount"              = "1"
    "batchSize"               = "1"
    "learningRate"            = "0.005"
    "learningRateWarmupSteps" = "0"
  }

  output_data_s3_uri   = "s3://titan-output-data/data/"
  training_data_s3_uri = "s3://titan-training-data/data/train.jsonl"
}

output "custom_model_arn" {
  description = "The ARN of the output model."
  value       = module.model.custom_model_arn
}

output "job_arn" {
  description = "The ARN of the customization job."
  value       = module.model.job_arn
}

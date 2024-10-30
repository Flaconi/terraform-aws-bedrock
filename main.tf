resource "aws_bedrock_custom_model" "this" {
  custom_model_name = var.name
  job_name          = var.job_name

  base_model_identifier   = data.aws_bedrock_foundation_model.this.model_arn
  custom_model_kms_key_id = var.model_kms_key_id
  customization_type      = var.model_customization_type
  hyperparameters         = var.model_hyperparameters
  role_arn                = var.model_role_arn

  output_data_config {
    s3_uri = var.output_data_s3_uri
  }

  training_data_config {
    s3_uri = var.training_data_s3_uri
  }

  dynamic "validation_data_config" {
    for_each = var.validation_data_s3_uri != null ? ["this"] : []
    content {
      validator {
        s3_uri = var.validation_data_s3_uri
      }
    }
  }

  dynamic "vpc_config" {
    for_each = var.vpc_config != null ? ["this"] : []
    content {
      security_group_ids = var.vpc_config["security_group_ids"]
      subnet_ids         = var.vpc_config["subnet_ids"]
    }
  }

  tags = var.tags
}

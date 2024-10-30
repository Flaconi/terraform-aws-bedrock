variable "name" {
  description = "Name for the custom model."
  type        = string
}

variable "job_name" {
  description = "A name for the customization job."
  type        = string
}

variable "foundation_model_id" {
  description = "Model identifier."
  type        = string
  default     = "amazon.titan-text-express-v1"
}

variable "model_kms_key_id" {
  description = "The custom model is encrypted at rest using this key. Specify the key ARN."
  type        = string
  default     = null
}

variable "model_customization_type" {
  description = "The customization type. Valid values: `FINE_TUNING`, `CONTINUED_PRE_TRAINING`."
  type        = string
  default     = null
}

variable "model_hyperparameters" {
  description = "Parameters related to tuning the model."
  type        = map(string)
  default     = {}
}

variable "model_role_arn" {
  description = "The Amazon Resource Name (ARN) of an IAM role that Bedrock can assume to perform tasks on your behalf."
  type        = string
}

variable "output_data_s3_uri" {
  description = "The S3 URI where the output data is stored."
  type        = string
}

variable "training_data_s3_uri" {
  description = "The S3 URI where the training data is stored."
  type        = string
}

variable "validation_data_s3_uri" {
  description = "The S3 URI where the validation data is stored."
  type        = string
  default     = null
}

variable "vpc_config" {
  description = "Configuration parameters for the private Virtual Private Cloud (VPC) that contains the resources you are using for this job."
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
  default = null
}

variable "tags" {
  description = "A map of tags to assign to the customization job and custom model."
  type        = map(string)
  default     = {}
}

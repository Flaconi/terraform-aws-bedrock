# Inspired by: https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-code-samples.html

resource "aws_s3_bucket" "training" {
  bucket = "bedrock-data-test-training"
}

resource "aws_s3_bucket" "output" {
  bucket = "bedrock-data-test-output"
}

data "aws_iam_policy_document" "trust_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["bedrock.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "s3_access" {
  statement {
    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.training.id}",
      "arn:aws:s3:::${aws_s3_bucket.training.id}/*"
    ]
  }
  statement {
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.output.id}",
      "arn:aws:s3:::${aws_s3_bucket.output.id}/*"
    ]
  }
}

resource "aws_iam_role" "this" {
  name               = "CustomModelRole"
  assume_role_policy = data.aws_iam_policy_document.trust_policy.json
}

resource "aws_iam_policy" "this" {
  name   = "CustomModelRolePolicy"
  policy = data.aws_iam_policy_document.s3_access.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_s3_object" "data" {
  bucket = aws_s3_bucket.training.id
  key    = "train.jsonl"
  source = "train.jsonl"
}

resource "random_string" "this" {
  length  = 16
  special = false
}

module "model" {
  source = "../../"

  name                = "titan"
  job_name            = "titan-job-${random_string.this.result}"
  foundation_model_id = "amazon.titan-text-express-v1"
  model_role_arn      = aws_iam_role.this.arn

  model_customization_type = "FINE_TUNING"
  model_hyperparameters = {
    "epochCount"              = "1"
    "batchSize"               = "1"
    "learningRate"            = "0.005"
    "learningRateWarmupSteps" = "0"
  }

  output_data_s3_uri   = "s3://${aws_s3_bucket.output.id}"
  training_data_s3_uri = "s3://${aws_s3_bucket.training.id}/train.jsonl"

  depends_on = [
    aws_s3_object.data
  ]
}

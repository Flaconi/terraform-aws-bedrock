# terraform-aws-bedrock

Module to create Amazon Bedrock custom model

[![lint](https://github.com/flaconi/terraform-aws-bedrock/workflows/lint/badge.svg)](https://github.com/flaconi/terraform-aws-bedrock/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/terraform-aws-bedrock/workflows/test/badge.svg)](https://github.com/flaconi/terraform-aws-bedrock/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/terraform-aws-bedrock.svg)](https://github.com/flaconi/terraform-aws-bedrock/releases)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

For requirements regarding module structure: [style-guide-terraform.md](https://github.com/Flaconi/devops-docs/blob/master/doc/conventions/style-guide-terraform.md)

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

<!-- TFDOCS_PROVIDER_START -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.73 |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.73 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: Name for the custom model.

Type: `string`

### <a name="input_job_name"></a> [job\_name](#input\_job\_name)

Description: A name for the customization job.

Type: `string`

### <a name="input_model_role_arn"></a> [model\_role\_arn](#input\_model\_role\_arn)

Description: The Amazon Resource Name (ARN) of an IAM role that Bedrock can assume to perform tasks on your behalf.

Type: `string`

### <a name="input_output_data_s3_uri"></a> [output\_data\_s3\_uri](#input\_output\_data\_s3\_uri)

Description: The S3 URI where the output data is stored.

Type: `string`

### <a name="input_training_data_s3_uri"></a> [training\_data\_s3\_uri](#input\_training\_data\_s3\_uri)

Description: The S3 URI where the training data is stored.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_foundation_model_id"></a> [foundation\_model\_id](#input\_foundation\_model\_id)

Description: Model identifier.

Type: `string`

Default: `"amazon.titan-text-express-v1"`

### <a name="input_model_kms_key_id"></a> [model\_kms\_key\_id](#input\_model\_kms\_key\_id)

Description: The custom model is encrypted at rest using this key. Specify the key ARN.

Type: `string`

Default: `null`

### <a name="input_model_customization_type"></a> [model\_customization\_type](#input\_model\_customization\_type)

Description: The customization type. Valid values: `FINE_TUNING`, `CONTINUED_PRE_TRAINING`.

Type: `string`

Default: `null`

### <a name="input_model_hyperparameters"></a> [model\_hyperparameters](#input\_model\_hyperparameters)

Description: Parameters related to tuning the model.

Type: `map(string)`

Default: `{}`

### <a name="input_validation_data_s3_uri"></a> [validation\_data\_s3\_uri](#input\_validation\_data\_s3\_uri)

Description: The S3 URI where the validation data is stored.

Type: `string`

Default: `null`

### <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config)

Description: Configuration parameters for the private Virtual Private Cloud (VPC) that contains the resources you are using for this job.

Type:

```hcl
object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
```

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the customization job and custom model.

Type: `map(string)`

Default: `{}`

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_model_arn"></a> [custom\_model\_arn](#output\_custom\_model\_arn) | The ARN of the output model. |
| <a name="output_job_arn"></a> [job\_arn](#output\_job\_arn) | The ARN of the customization job. |

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2024 **[Flaconi GmbH](https://github.com/flaconi)**

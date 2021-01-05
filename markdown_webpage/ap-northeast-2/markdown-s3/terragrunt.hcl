terraform {
  #source = "git::git@github.com:terraform-aws-modules/terraform-aws-s3-bucket.git?ref=v1.6.0"
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-s3-bucket.git?ref=v1.6.0"
}

include {
   path = find_in_parent_folders()
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/1.6.0?tab=inputs
###########################################################
inputs = {
  # (Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name.
  # type: string
  bucket = "markdown-s3"

  # (Optional) If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee.
  # type: string
  region = "ap-northeast-2"  
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "ap-northeast-2"
  access_key = "AKIAR2BJRAVVT5HOMANC"
  secret_key = "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"
}
EOF
}

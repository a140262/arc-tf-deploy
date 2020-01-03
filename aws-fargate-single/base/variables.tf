/*
 * variables.tf
 * Common variables to use in various Terraform files (*.tf)
 */

# The AWS region to use for the bucket and registry; typically `us-east-1`.
# Other possible values: `us-east-2`, `us-west-1`, or `us-west-2`.
# Currently, Fargate is only available in `us-east-1`.
variable "region" {
  default = "ap-southeast-2"
}

# The AWS profile to use, this would be the same value used in AWS_PROFILE.
variable "aws_profile" {
  default = "default"
}


# The role that will have access to the S3 bucket, this should be a role that all
# members of the team have access to.
variable "saml_role" {
  default= "s3-tf-remote-state"
}

# Name of the application. This value should usually match the application tag below.
variable "app" {
  default = "arcdemo"
}

# A map of the tags to apply to various resources. The required tags are:
# `application`, name of the app;
# `environment`, the environment being created;
# `team`, team responsible for the application;
# `contact-email`, contact email for the _team_;
# and `customer`, who the application was create for.
variable "tags" {
  type = map(string)
   default = {
    "team" = "my-team"
    "application" = "arcdemo"
    "environment" ="dev"
    "customer"="my-cust"
  }
}
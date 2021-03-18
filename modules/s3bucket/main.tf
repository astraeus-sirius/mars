variable "region" {
  default = "us-east-2"
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

// Calling module:

module "aws_s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = "jacobias-test-bucket"
  acl    = "private"

}

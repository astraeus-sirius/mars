terraform {
  required_version = "~> 0.12.0"

  backend "s3" {}
}
# Configure the Dyn provider
provider "dyn" {
  customer_name = "${var.dyn_customer_name}"
  username      = "${var.dyn_username}"
  password      = "${var.dyn_password}"
}
provider "aws" {
  region = "${var.region}"
}
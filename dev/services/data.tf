data "aws_caller_identity" "current" {
}

data "aws_availability_zones" "available" {
}

data "aws_region" "current" {
}

data "aws_elb_service_account" "main" {
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "iasterraform-dev"
    key    = "vpc/dev.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "iam" {
  backend = "s3"
  config = {
    bucket = "iasterraform"
    key    = "iam/Global.tfstate"
    region = "us-east-2"
  }
}

data "aws_availability_zones" "all" {}
data "aws_ami" "awg_web" {
  most_recent = true
  owners      = ["665515063972"] # IAS

  filter {
    name = "name"

    values = [
      "packer-demo-dotnetcore-local-*",
    ]
  }
}

#Data for AMI ID
data "aws_ami" "image" {
  most_recent = true

  owners = ["self"]
  tags = {
    Name   = "packer-dev*"
    Tested = "true"
  }
}


data "aws_ami" "sftp" {
  most_recent = true
  owners      = ["665515063972"] # IAS

  filter {
    name = "name"

    values = [
      "ias-windows-2019-base-*",
    ]
  }
}
data "terraform_remote_state" "dyn" {
  backend = "s3"
  config = {
    bucket = "iasterraform"
    key    = "dyn/Global.tfstate"
    region = "us-east-2"
  }
}
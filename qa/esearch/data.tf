
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "iasterraform-vpc"
    key    = "vpc.tfstate"
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

data "aws_ami" "esearch" {
  most_recent = true
  owners      = ["665515063972"] # IAS

  filter {
    name = "name"

    values = [
      "Esearch*",
    ]
  }
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = "${data.terraform_remote_state.vpc.outputs.vpc_id}"
}
#Data for AMI ID

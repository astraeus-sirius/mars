data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "iasterraform"
    key    = "vpc/QA.tfstate"
    region = "us-east-2"
  }
}

data "aws_ami" "bastion" {
  most_recent = true
  owners      = ["665515063972"] # IAS

  filter {
    name = "name"

    values = [
      "bastion-base*",
    ]
  }
}
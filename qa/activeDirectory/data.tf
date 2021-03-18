data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "iasterraform-vpc"
    key    = "vpc.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "services" {
  backend = "s3"
  config = {
    bucket = "iasterraform"
    key    = "services/QA.tfstate"
    region = "us-east-2"
  }
}

data "terraform_remote_state" "bastion" {
  backend = "s3"
  config = {
    bucket = "iasterraform-mgmt"
    key    = "bastion/mgmt.tfstate"
    region = "us-east-2"
  }
}
data "terraform_remote_state" "jenkins" {
  backend = "s3"
  config = {
    bucket = "iasterraform-mgmt"
    key    = "jenkins/mgmt.tfstate"
    region = "us-east-2"
  }
}
data "terraform_remote_state" "terraform" {
  backend = "s3"
  config = {
    bucket = "iasterraform-mgmt"
    key    = "terraform-server/mgmt.tfstate"
    region = "us-east-2"
  }
}
data "terraform_remote_state" "activeDirectory" {
  backend = "s3"
  config = {
    bucket = "iasterraform"
    key    = "activeDirectory/QA.tfstate"
    region = "us-east-2"
  }
}
data "terraform_remote_state" "esearch" {
  backend = "s3"
  config = {
    bucket = "iasterraform"
    key    = "esearch/QA.tfstate"
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
data "aws_ami" "iasad" {
  most_recent = true
  owners      = ["665515063972"] # IAS

  filter {
    name = "name"

    values = [
      "ias-windows-2019-base-*",
    ]
  }
}

data "template_file" "ssm_doc" {
  template = "${file("ssm_doc.json.tpl")}"

  vars = {
    schemaVersion = "2.2"
    directoryId = "${aws_directory_service_directory.ias_ad.id}",
    directoryName = "${var.dir_domain_name}"
    directoryOU = "${var.dir_computer_ou}"
    dnsIpAddresses = "${join(",", formatlist("\"%s\"", aws_directory_service_directory.ias_ad.dns_ip_addresses))}"
  }
}

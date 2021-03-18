data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = "${module.vpc.vpc_id}"
}
data "terraform_remote_state" "ad" {
  backend = "s3"
  config = {
    bucket = "iasterraform"
    key    = "activeDirectory/QA.tfstate"
    region = "us-east-2"
  }
}
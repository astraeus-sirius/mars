data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "iasterraform-vpc"
    key    = "vpc.tfstate"
    region = "us-east-2"
  }
}
data "terraform_remote_state" "ad" {
  backend = "s3"
  config = {
    bucket = "iasterraform"
    key    = "activeDirectory/QA.tfstate"
    region = "us-east-2"
  }
}
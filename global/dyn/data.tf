data "terraform_remote_state" "services" {
  backend = "s3"
  config = {
    bucket = "iasterraform"
    key    = "services/QA.tfstate"
    region = "us-east-2"
  }
}
data "terraform_remote_state" "services-dev" {
  backend = "s3"
  config = {
    bucket = "iasterraform-dev"
    key    = "services/dev.tfstate"
    region = "us-east-2"
  }
}
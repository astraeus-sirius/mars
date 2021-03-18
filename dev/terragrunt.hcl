remote_state {
  backend = "s3"
  config = {
    bucket         = "iasterraform-dev"
    key            = "${path_relative_to_include()}/dev.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "IASInfrastructure-dev"
  }   
}
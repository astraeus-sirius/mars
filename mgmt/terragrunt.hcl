remote_state {
  backend = "s3"
  config = {
    bucket         = "iasterraform-mgmt"
    key            = "${path_relative_to_include()}/mgmt.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "IASInfrastructure-mgmt"
  }   
}
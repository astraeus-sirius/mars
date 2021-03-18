remote_state {
  backend = "s3"
  config = {
    bucket         = "iasterraform-rds"
    key            = "${path_relative_to_include()}/rds.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "IASInfrastructure-QA"
  }   
}
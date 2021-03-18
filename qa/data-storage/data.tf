data "aws_kms_secrets" "rds_secret" {
  secret {
    name = "master_password"
    payload = "AQICAHgKVOVOIahbudAivgxeQ+a/sN37AK5w7QBYeB2S4BWqGQE+knA299aNzNH27Dk4MROSAAAAbTBrBgkqhkiG9w0BBwagXjBcAgEAMFcGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMOOMJc7ceVdqznoYBAgEQgCqCVT67jhcI+44fE/H8sv6topOGBoflfie0M/6XM4a4CawhRu6Mx9Cgbhc="
    context = {
      foo = "bar"
    }
  }
}
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "iasterraform-vpc"
    key    = "vpc.tfstate"
    region = "us-east-2"
  }
}

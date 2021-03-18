variable "region" {
    default = "us-east-2"
}
variable "jenkins_tags" { 
    type = "map" 
    default = { 
        Name: "jenkins2-win2019",
        ID: "jenkins"
        Environment: "staging"
  } 
}
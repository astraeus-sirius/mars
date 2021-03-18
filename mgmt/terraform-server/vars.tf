variable "region" {
    default = "us-east-2"
}
variable "terraform_tags" { 
    type = "map" 
    default = { 
        Name: "terraform-server",
        ID: "terraform-server"
        Environment: "Management"
  } 
}
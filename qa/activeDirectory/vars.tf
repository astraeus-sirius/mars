variable "default_tags" { 
    type = "map" 
    default = { 
        Name: "AWG_Shared",
        ID: "File Server"
        Environment: "staging"
  } 
}
variable "region" {
    default = "us-east-2"
}

# Directory Service
variable "dir_domain_name" {}
variable "dir_admin_password" {}
variable "dir_type" {}
variable "dir_computer_ou" {}
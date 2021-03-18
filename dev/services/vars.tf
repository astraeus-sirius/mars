variable "region" {
    default = "us-east-1"
}

variable "AWG_DEV_Tags" { 
    type = "map" 
    default = { 
        Name: "AWG_Web_Server_Dev",
        ID: "AWG_Web_Server_Dev"
        Environment: "dev"
  } 
}
#dyn creds
variable "dyn_customer_name" {
    default = "skyjor"
}

variable "dyn_username" {
    default = "mjaweed"
}

variable "dyn_password" {
    default = "uej6A1C33eIW"
}
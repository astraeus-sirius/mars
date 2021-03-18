variable "bastion_tags" { 
    type = "map" 
    default = { 
        Name: "AWS_Bastion",
        ID: "BASTION"
        Environment: "Management"
  } 
}
variable "region" {
    default = "us-east-2"
}
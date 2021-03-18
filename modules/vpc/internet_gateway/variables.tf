variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
}
variable "subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
}
variable "name" {
  description = "Name to be used on all the resources as identifier"
}
variable "igw_tags" {
  description = "Additional tags for the internet gateway"
  type        = map(string)
}
variable "vpc_id" {
  description = "Identifier of the VPC"
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
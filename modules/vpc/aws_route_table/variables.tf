variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
}
variable "subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
}
variable "subnet_suffix" {
  description = "Suffix to append to public subnets name"
  type        = string
}
variable "name" {
  description = "Name to be used on all the resources as identifier"
}
variable "route_table_tags" {
  description = "Additional tags for the public route tables"
  type        = map(string)
}
variable "vpc_id" {
  description = "Identifier of the VPC"
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
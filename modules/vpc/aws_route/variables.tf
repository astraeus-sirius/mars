variable "route_table_id" {
  description = "ID of route table"
}
variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
}
variable "subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
}
variable "gateway_id" {
  description = "ID of Gateway"
}
variable "destination_cidr_block" {
  description = "cidr block of the destination"
}
variable "vpc_id" {
  description = "Identifier of the VPC"
}
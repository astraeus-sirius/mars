variable "region" {
    default = "us-east-1"
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24"]
}
variable "public_subnets" {
  type    = list(string)
  default = ["10.30.11.0/24", "10.30.12.0/24", "10.30.13.0/24"]
}
variable "database_subnets" {
  type    = list(string)
  default = ["10.30.21.0/24", "10.30.22.0/24", "10.30.23.0/24"]
}
variable "database_subnets_az" {
  type    = list(string)
  default = ["10.30.61.0/24", "10.30.62.0/24", "10.30.63.0/24"]
}
variable "elasticache_subnets" {
  type    = list(string)
  default = ["10.30.31.0/24", "10.30.32.0/24", "10.30.33.0/24"]
}
variable "redshift_subnets" {
  type    = list(string)
  default = ["10.30.41.0/24", "10.30.42.0/24", "10.30.43.0/24"]
}
variable "intra_subnets" {
  type    = list(string)
  default = ["10.30.51.0/24", "10.30.52.0/24", "10.30.53.0/24"]
}
variable "admin_cidrs" {
  type    = list(string)
  default = ["70.112.149.249/32", "141.158.61.95/32", "142.197.242.61/32", "99.185.130.128/32", "10.30.11.131/32"]
}
variable "dir_domain_name"{
  default = "ias.com"
}
variable "domain_dns_ips"{
  type    = list(string)
  default = ["10.20.1.179", "10.20.2.104"]
}
variable"peer_owner_id"{
  default = "665515063972"
}

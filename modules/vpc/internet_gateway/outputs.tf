output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = concat([aws_internet_gateway.gateway_id[0].id], [""])[0]
}
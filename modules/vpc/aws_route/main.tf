resource "aws_route" "route_id"{
  count = var.create_vpc && length(var.subnets) > 0 ? 1 : 0

  route_table_id         = var.route_table_id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = var.gateway_id

  timeouts {
    create = "5m"
  }
}
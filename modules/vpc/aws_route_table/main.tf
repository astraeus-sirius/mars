resource "aws_route_table" "route_table_id" {
  count = var.create_vpc && length(var.subnets) > 0 ? 1 : 0

  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      "Name" = format("%s-${var.subnet_suffix}", var.name)
    },
    var.route_table_tags,
  )
}
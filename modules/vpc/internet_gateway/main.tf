resource "aws_internet_gateway" "gateway_id" {
  count = var.create_vpc && length(var.subnets) > 0 ? 1 : 0

  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.name)
    },
    var.igw_tags,
  )
}
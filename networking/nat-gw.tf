resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.external_subnets.0.id}"
}

resource "aws_eip" "nat" {
  vpc      = true
}

resource "aws_route" "nat_route" {
  route_table_id            = "${aws_route_table.internal_route_table.id}"
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = "${aws_nat_gateway.gw.id}"
}

# Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.nathan-temp-vpc.id}"
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

resource "aws_route" "igw_route" {
  route_table_id            = "${aws_route_table.external_route_table.id}"
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id            = "${aws_internet_gateway.igw.id}"
}

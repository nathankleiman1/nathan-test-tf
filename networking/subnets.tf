
# Subnets

resource "aws_subnet" "internal_subnets" {
  count                   = "${length(var.vpc_availability_zones)}"
  vpc_id                  = "${aws_vpc.nathan-temp-vpc.id}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr ,8, count.index)}"
  availability_zone       = "${element(var.vpc_availability_zones,count.index)}"

  tags = {
    Name =  "${var.vpc_name}-internal-${count.index}"
  }
}

resource "aws_subnet" "external_subnets" {
  count                   = "${length(var.vpc_availability_zones)}"
  vpc_id                  = "${aws_vpc.nathan-temp-vpc.id}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr ,8, count.index+length(var.vpc_availability_zones))}"
  availability_zone       = "${element(var.vpc_availability_zones,count.index)}"

  tags = {
    Name =  "${var.vpc_name}-external-${count.index}"
  }
}


resource "aws_route_table_association" "int_route_table_association" {
  count          = "${length(var.vpc_availability_zones)}"
  subnet_id      = "${element(aws_subnet.internal_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.internal_route_table.id}"
}

resource "aws_route_table_association" "ext_route_table_association" {
  count          = "${length(var.vpc_availability_zones)}"
  subnet_id      = "${element(aws_subnet.external_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.external_route_table.id}"
}

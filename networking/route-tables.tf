resource "aws_route_table" "internal_route_table" {
  vpc_id = "${aws_vpc.nathan-temp-vpc.id}"
  tags = {
      Name =  "${var.vpc_name}-internal-${count.index}"
    }
}

resource "aws_route_table" "external_route_table" {
  vpc_id = "${aws_vpc.nathan-temp-vpc.id}"
  tags = {
      Name =  "${var.vpc_name}-external-${count.index}"
    }
}
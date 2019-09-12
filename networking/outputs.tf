output "internal_subnet_ids" {
  value = ["${aws_subnet.internal_subnets.*.id}"]
}

output "external_subnet_ids" {
  value = ["${aws_subnet.external_subnets.*.id}"]
}

output "vpc_id" {
  value = "${aws_vpc.nathan-temp-vpc.id}"
}


resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name        = "${var.environment}-private-route-table"
    Environment = "${var.environment}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name        = "${var.environment}-public-route-table"
    Environment = "${var.environment}"
  }
}

resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = "${aws_route_table.private.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}


resource "aws_route_table_association" "public" {
  #count          = "${length(var.public_subnets_cidr)}"
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private" {
  #count          = "${length(var.private_subnets_cidr)}"
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = "${aws_route_table.private.id}"
}

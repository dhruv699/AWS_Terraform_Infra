output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnets_id" {
  value = aws_subnet.private_subnet.id
}

output "public_sg_id" {
  value = aws_security_group.public.id
}
output "private_sg_id" {
  value = aws_security_group.private.id
}

output "public_route_table" {
  value = aws_route_table.public.id
}

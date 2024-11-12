# locals {
#   availability_zones = ["${var.aws_region}a", "${var.aws_region}c"]
# }

# ####################################################################
# #                             VPC                                  #
# ####################################################################

# resource "aws_vpc" "vpc" {
#   cidr_block = var.vpc_cidr

#   enable_dns_hostnames = true
#   enable_dns_support   = true

#   tags = {
#     Name        = "vpc"
#   }
# }

# ####################################################################
# #                             Subnet                               #
# ####################################################################

# resource "aws_subnet" "public_subnet" {
#   vpc_id = aws_vpc.vpc.id
#   count = length(var.public_subnets_cidr)
#   cidr_block = element(var.public_subnets_cidr, count.index)
#   availability_zone = element(local.availability_zones, count.index)

#   map_public_ip_on_launch = true

#   depends_on = [ aws_vpc.vpc ]

#   tags = {
#     Name        = "${element(local.availability_zones, count.index)}-public-subnet"
#   }
# }

# resource "aws_subnet" "private_subnet" {
#   vpc_id = aws_vpc.vpc.id
#   count = length(var.private_subnets_cidr)
#   cidr_block = element(var.private_subnets_cidr, count.index)
#   availability_zone = element(local.availability_zones, count.index)

#   map_public_ip_on_launch = false

#   depends_on = [ aws_vpc.vpc ]

#   tags = {
#     Name        = "${element(local.availability_zones, count.index)}-private-subnet"
#   }
# }

# ####################################################################
# #                             Gateway                              #
# ####################################################################

# resource "aws_internet_gateway" "ig" {
#   vpc_id = aws_vpc.vpc.id

#   depends_on = [ aws_vpc.vpc ]

#   tags = {
#     Name = "internet_gateway"
#   }
# }

# resource "aws_eip" "nat_eip_az1" {
#   domain = "vpc"
#   depends_on = [ aws_vpc.vpc ]
# }

# resource "aws_nat_gateway" "nat_az1" {
#   allocation_id = aws_eip.nat_eip_az1.id
#   subnet_id = element(aws_subnet.public_subnet.*.id, 0)

#   depends_on = [ aws_eip.nat_eip_az1 ]

#   tags = {
#     Name = "nat_gateway_az1"
#   }
# }

# resource "aws_eip" "nat_eip_az2" {
#   domain = "vpc"
#   depends_on = [ aws_vpc.vpc ]
# }

# resource "aws_nat_gateway" "nat_az2" {
#   allocation_id = aws_eip.nat_eip_az2.id
#   subnet_id = element(aws_subnet.public_subnet.*.id, 1)

#   depends_on = [ aws_eip.nat_eip_az2 ]

#   tags = {
#     Name = "nat_gateway_az2"
#   }
# }

# # Each AZ should have corresponding nat, but we only create a single NAT
# # gateway with one single elastic ip here.

# ####################################################################
# #                             Route Table                          #
# ####################################################################

# # Routing tables to route traffic for Private Subnet
# resource "aws_route_table" "private_az1" {
#   vpc_id = aws_vpc.vpc.id

#   depends_on = [ aws_vpc.vpc ]

#   tags = {
#     Name        = "private-route-table-az1"
#   }
# }

# resource "aws_route_table" "private_az2" {
#   vpc_id = aws_vpc.vpc.id

#   depends_on = [ aws_vpc.vpc ]

#   tags = {
#     Name        = "private-route-table-az2"
#   }
# }

# # Routing tables to route traffic for Public Subnet
# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.vpc.id

#   depends_on = [ aws_vpc.vpc ]

#   tags = {
#     Name        = "public-route-table"
#   }
# }

# ####################################################################
# #                             Route                                #
# ####################################################################

# resource "aws_route" "public_internet_gateway" {
#   route_table_id         = aws_route_table.public.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.ig.id
# }

# resource "aws_route" "private_internet_gateway_az1" {
#   route_table_id         = aws_route_table.private_az1.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id      = aws_nat_gateway.nat_az1.id
# }

# resource "aws_route" "private_internet_gateway_az2" {
#   route_table_id         = aws_route_table.private_az2.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id      = aws_nat_gateway.nat_az2.id
# }

# ####################################################################
# #                      Route Table Association                     #
# ####################################################################

# resource "aws_route_table_association" "public" {
#   count          = length(var.public_subnets_cidr)
#   subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "private_az1" {
#   subnet_id      = element(aws_subnet.private_subnet.*.id, 0)
#   route_table_id = aws_route_table.private_az1.id
# }

# resource "aws_route_table_association" "private_az2" {
#   subnet_id      = element(aws_subnet.private_subnet.*.id, 1)
#   route_table_id = aws_route_table.private_az2.id
# }
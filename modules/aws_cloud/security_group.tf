# resource "aws_security_group" "default_security_group" {
#   name = "default_security_group"

#   vpc_id = aws_vpc.vpc.id

#   tags = {
#     Name = "default_security_group"
#   }
# }

# resource "aws_vpc_security_group_ingress_rule" "default_ingress_aws" {
#   security_group_id = aws_security_group.default_security_group.id
#   cidr_ipv4 = "3.112.23.0/29"
#   from_port = 22
#   ip_protocol = "tcp"
#   to_port = 22
# }

# resource "aws_vpc_security_group_ingress_rule" "default_ingress_local" {
#   security_group_id = aws_security_group.default_security_group.id
#   cidr_ipv4 = "220.134.96.6/32"
#   from_port = 22
#   ip_protocol = "tcp"
#   to_port = 22
# }

# resource "aws_vpc_security_group_egress_rule" "default_egress_rule" {
#   security_group_id = aws_security_group.default_security_group.id
#   cidr_ipv4 = "0.0.0.0/0"
#   ip_protocol = -1
# }

# resource "aws_vpc_security_group_ingress_rule" "default_same_sg_connection_ingress" {
#   security_group_id = aws_security_group.default_security_group.id
#   referenced_security_group_id = aws_security_group.default_security_group.id
#   ip_protocol = -1

# }

# resource "aws_vpc_security_group_egress_rule" "default_same_sg_connection_egress" {
#   security_group_id = aws_security_group.default_security_group.id
#   referenced_security_group_id = aws_security_group.default_security_group.id
#   ip_protocol = -1

# }
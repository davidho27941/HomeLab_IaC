# resource "aws_instance" "az1_public" {
#   ami = data.aws_ami.ubuntu.id

#   instance_type = "t3.small"

#   subnet_id = aws_subnet.public_subnet[0].id

#   vpc_security_group_ids = [aws_security_group.default_security_group.id]

#   key_name = var.macbook_tls_key_name

#   depends_on = [ aws_subnet.public_subnet, aws_subnet.private_subnet]

#   root_block_device {
#     volume_size = 200
#   }

#   tags = {
#     Name = "az1_public"
#   }

# }

# resource "aws_instance" "az1_private" {
#   ami = data.aws_ami.ubuntu.id

#   instance_type = "t3.small"

#   subnet_id = aws_subnet.private_subnet[0].id

#   security_groups = [aws_security_group.default_security_group.id]

#   key_name = var.macbook_tls_key_name

#   depends_on = [ aws_subnet.private_subnet ]

#   root_block_device {
#     volume_size = 200
#   }

#   tags = {
#     Name = "az1_private"
#   }

# }

# resource "aws_instance" "az2_public" {
#   ami = data.aws_ami.ubuntu.id

#   instance_type = "t3.small"

#   subnet_id = aws_subnet.public_subnet[1].id

#   vpc_security_group_ids = [aws_security_group.default_security_group.id]

#   key_name = var.macbook_tls_key_name

#   depends_on = [ aws_subnet.public_subnet, aws_subnet.private_subnet]

#   root_block_device {
#     volume_size = 200
#   }

#   tags = {
#     Name = "az2_public"
#   }

# }

# resource "aws_instance" "az2_private" {
#   ami = data.aws_ami.ubuntu.id

#   instance_type = "t3.small"

#   subnet_id = aws_subnet.private_subnet[1].id

#   security_groups = [aws_security_group.default_security_group.id]

#   key_name = var.macbook_tls_key_name

#   depends_on = [ aws_subnet.private_subnet ]

#   root_block_device {
#     volume_size = 200
#   }

#   tags = {
#     Name = "az2_private"
#   }

# }
resource "tls_private_key" "macbook_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "local_file" "tls_key" {
  content = tls_private_key.macbook_key.private_key_pem
  filename = "${var.secret_folder}/${var.macbook_tls_key_filename}"
  file_permission = "0400"
}

resource "aws_key_pair" "macbook" {
  key_name = var.macbook_tls_key_name
  public_key = tls_private_key.macbook_key.public_key_openssh
}
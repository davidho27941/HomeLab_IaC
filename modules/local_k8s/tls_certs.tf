# ###################################################################
#                          ROOT CA                                  #
# ###################################################################

resource "tls_private_key" "root_ca_private_key" {
  algorithm = "RSA"
  rsa_bits = "4096"
}

resource "tls_self_signed_cert" "root_ca" {
  private_key_pem = tls_private_key.root_ca_private_key.private_key_pem

  dns_names = [ "homelab.me" ]

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]

  validity_period_hours = 8760

  is_ca_certificate = true

  subject {
    common_name = "homelab.me"
    country = "TW"
    province = "Hsinchu"
    locality = "Hsinchu"
    organization = "David Ho"
  }
}

resource "local_file" "root_ca_cert" {
  content = tls_self_signed_cert.root_ca.cert_pem
  filename = "/Users/davidho/workplace/HomeLab_IaC/assets/certs/ca.crt"
}

resource "local_file" "root_ca_key" {
  content = tls_private_key.root_ca_private_key.private_key_pem
  filename = "/Users/davidho/workplace/HomeLab_IaC/assets/certs/ca.key"

}
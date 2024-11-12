resource "kubernetes_secret" "homelab_ca_secret" {
  metadata {
    name = "homelab-ca-secret"
    namespace = "cert-manager"
  }
  
  type = "Opaque"

  data = {
    "tls.crt" = tls_self_signed_cert.root_ca.cert_pem
    "tls.key" = tls_private_key.root_ca_private_key.private_key_pem
  }
}
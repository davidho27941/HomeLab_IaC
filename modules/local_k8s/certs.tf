# ###################################################################
#                      Airflow Certificate                          #
# ###################################################################

resource "kubernetes_manifest" "airflow_tls_cert" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind = "Certificate"

    metadata = {
      name = "airflow-cert"
      namespace = kubernetes_namespace.airflow.metadata[0].name
    }

    spec = {
      secretName = "airflow-tls-cert"
      issuerRef = {
        name = kubernetes_manifest.homelab_ca_issuer.manifest.metadata.name
        kind = "ClusterIssuer"
      }
      dnsNames = [
        var.airflow_dns_name
      ]
    }
  }

}

data "kubernetes_secret" "airflow_cert_secret" {
  metadata {
    name = kubernetes_manifest.airflow_tls_cert.object.spec.secretName
    namespace = kubernetes_namespace.airflow.metadata[0].name
  }
}

resource "local_file" "airflow_tls_cert" {
  content = data.kubernetes_secret.airflow_cert_secret.data["tls.crt"]
  filename = "/Users/davidho/workplace/HomeLab_IaC/assets/certs/${var.airflow_dns_name}.crt"
}

resource "local_file" "airflow_tls_key" {
  content = data.kubernetes_secret.airflow_cert_secret.data["tls.key"]
  filename = "/Users/davidho/workplace/HomeLab_IaC/assets/certs/${var.airflow_dns_name}.key"
}
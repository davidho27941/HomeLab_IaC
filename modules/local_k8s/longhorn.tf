resource "helm_release" "longhorn" {
  name = "longhorn"

  repository = "https://charts.longhorn.io"
  chart = "longhorn"

  namespace = "longhorn-system"
  create_namespace = true

  version = "1.6.3"

  set {
    name = "ingress.enabled"
    value = "true"
  }

  set {
    name = "ingress.host"
    value = "longhorn.homelab.me"
  }

}
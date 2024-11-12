terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.15.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.32.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.0.6"
    }
  }
}

provider "kubernetes" {
  config_path = "/Users/davidho/workplace/HomeLab_IaC/modules/local_k8s/config"
}

provider "helm" {
  kubernetes {
    config_path = "/Users/davidho/workplace/HomeLab_IaC/modules/local_k8s/config"
  }

  registry {
    url = "https://gitlab.homelab.me:5050"
    username = var.registry_username
    password = var.registry_password
  }
}

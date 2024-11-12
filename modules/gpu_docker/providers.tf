terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }

}

provider "docker" {
  host = "ssh://david@192.168.0.31"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null", "-i", "/Users/davidho/.ssh/id_rsa"]

  registry_auth {
    address  = "gitlab.homelab.me:5050"
    username = var.registry_username
    password = var.registry_password
  }
}
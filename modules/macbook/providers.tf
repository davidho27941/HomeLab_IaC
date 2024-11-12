terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }

}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

module "n8n_submodule" {
  source = "./sub_modules/n8n/"
}
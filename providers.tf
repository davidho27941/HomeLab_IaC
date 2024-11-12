terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }

  backend "http" {
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
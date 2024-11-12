resource "docker_image" "ubuntu" {
  name = "ubuntu:22.04"
}

resource "docker_image" "python3_10" {
  name = "python:3.10"
}

resource "docker_image" "python3_12" {
  name = "python:3.12"
}

resource "docker_image" "neo4j" {
  name = "neo4j:5.24-community-bullseye"
}

resource "docker_image" "postgres_17" {
  name = "postgres:17.0"
}
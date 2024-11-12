resource "docker_image" "ubuntu" {
  name = "ubuntu:22.04"
}

resource "docker_image" "python3_10" {
  name = "python:3.10"
}

resource "docker_image" "python3_12" {
  name = "python:3.12"
}

resource "docker_image" "n8n" {
  name = "docker.n8n.io/n8nio/n8n"
}

resource "docker_image" "postgres16" {
  name = "postgres:16"
}

resource "docker_image" "ngc_pytorch_2406" {
  name = "nvcr.io/nvidia/pytorch:24.06-py3"
}

resource "docker_image" "inari_llama_0_1_0" {
  name = "gitlab.homelab.me:5050/side-project/llama3.2-chatbot:v0.1.0"
}

resource "docker_image" "hygieia_tsa" {
  name = "hygieia:tsa"
}
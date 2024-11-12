resource "docker_volume" "n8n_volume" {
  name = "n8n_volume"
}

resource "docker_volume" "n8n_db_volume" {
  name = "n8n_db_volume"
}
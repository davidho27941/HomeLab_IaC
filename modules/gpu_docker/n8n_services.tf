variable "postgres_root_user" {
  type = string
  default = "changeUser"
}

variable "postgres_password" {
  type = string
  sensitive = true
  default = "changePassword"
}

variable "postgres_db" {
  type = string
  default = "n8n"
}

variable "postgres_non_root_user" {
  type = string
  default = "changeUser"
}

variable "postgres_non_root_user_password" {
  type = string
  default = "changePassword"
}

variable "postgres_db_port" {
  type = number
  default = 5432
}

variable "n8n_db_type" {
  type = string
  default = "postgresdb"
}

variable "n8n_ip" {
  type = string
  default = "192.168.0.31"
}

resource "docker_container" "n8n_postgres" {
  name = "n8n_postgres"
  image = docker_image.postgres16.image_id

  tty = true
  restart = "always"

  env = [ 
    "POSTGRES_USER=${var.postgres_root_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}",
    "POSTGRES_NON_ROOT_USER=${var.postgres_non_root_user}",
    "POSTGRES_NON_ROOT_PASSWORD=${var.postgres_non_root_user_password}",
   ]

  networks_advanced {
    name = docker_network.n8n_network.name
  }

  volumes {
    container_path = "/var/lib/postgresql/data"
    volume_name = docker_volume.n8n_db_volume.name
  }

  mounts {
    source =  "/home/david/init-data.sh"
    target = "/docker-entrypoint-initdb.d/init-data.sh"
    type = "bind"
  }

  healthcheck {
    test = [ 
        "CMD-SHELL", 
        "pg_isready -h localhost -U ${var.postgres_root_user} -d ${var.postgres_db}" 
    ]
    interval = "5s"
    retries = 10
    timeout = "5s"
  }
  
}

resource "docker_container" "n8n" {
  name = "n8n"
  image = docker_image.n8n.image_id

  tty = true
  restart = "always"

  env = [
    "DB_TYPE=${var.n8n_db_type}",
    "DB_POSTGRESDB_HOST=${docker_container.n8n_postgres.name}",
    "DB_POSTGRESDB_PORT=${var.postgres_db_port}",
    "DB_POSTGRESDB_DATABASE=${var.postgres_db}",
    "DB_POSTGRESDB_USER=${var.postgres_non_root_user}",
    "DB_POSTGRESDB_PASSWORD=${var.postgres_non_root_user_password}",
    "N8N_SECURE_COOKIE=false"
  ]

  networks_advanced {
    name = docker_network.n8n_network.name
  }

  ports {
    internal = 5678
    external = 5678
    ip = var.n8n_ip
  }

  volumes {
    container_path = "/home/node/.n8n"
    volume_name = docker_volume.n8n_volume.name
  }
  
  depends_on = [
    docker_container.n8n_postgres
  ]

}

output "n8n_url" {
  value = "http://${docker_container.n8n.ports[0].ip}:${docker_container.n8n.ports[0].external}"
}
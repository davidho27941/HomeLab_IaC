resource "docker_container" "ds_cafe_tips" {
  image = docker_image.python3_10.image_id
  name  = "ds_cafe_tips"

  network_mode = "host"
  tty = true
  restart = "always"

  mounts {
    source = "/Users/davidho/workplace/blogs"
    target = "/root/blogs"
    type = "bind"
  }
}

resource "docker_container" "morpho" {
  image = docker_image.python3_12.image_id
  name = "morpho"

  network_mode = "host"
  tty = true
  restart = "always"

  mounts {
    source = "/Users/davidho/workplace/Morpho"
    target = "/root/Morpho"
    type = "bind"
  }

}

resource "docker_container" "morpho-postgres" {
  image = docker_image.postgres_17.image_id
  name = "morpho-postgres"

  network_mode = "host"
  tty = true
  restart = "always"

  env = [
    "POSTGRES_PASSWORD=a96427xyf",
    "POSTGRES_USER=david",
    "PGDATA=/var/lib/postgresql/data/pgdata",
  ]

  mounts {
    source = "/Users/davidho/workplace/Morpho"
    target = "/root/Morpho"
    type = "bind"
  }

  mounts {
    source = "/Users/davidho/workplace/Morpho/pgdata"
    target = "/var/lib/postgresql/data"
    type = "bind"
  }

}

# resource "docker_container" "name" {
#   image = docker_image.neo4j.image_id
#   name = "neo4j"

#   network_mode = "host"
#   tty = true
#   restart = "always"

#   mounts {
#     source = "/Users/davidho/workplace/neo4j/data"
#     target = "/data"
#     type = "bind"
#   }

#   env = [
#     "NEO4J_AUTH=neo4j/test_password"
#   ]
# }
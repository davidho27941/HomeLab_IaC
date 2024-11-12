resource "docker_container" "llama3_2" {
  name = "llama3_2"
  image = docker_image.inari_llama_0_1_0.image_id

  tty = true
  restart = "always"
  must_run = true
  runtime = "nvidia"
  gpus = "all"

  mounts {
    source =  "/home/david/workplace/"
    target = "/root/workplace/"
    type = "bind"
    read_only = false
  }

  network_mode = "host"
  
}

resource "docker_container" "hygieia_tsa" {
  name = "hygieia_tsa"
  image = docker_image.hygieia_tsa.image_id

  tty = true
  restart = "always"
  must_run = true
  runtime = "nvidia"
  gpus = "all"

  mounts {
    source =  "/home/david/workplace/"
    target = "/root/workplace/"
    type = "bind"
    read_only = false
  }

  network_mode = "host"
  
}

terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.23.1"
    }
  }
}

provider "docker" {
}

resource "docker_image" "ubuntu_image" {
   name = "ubuntu:22.04"
   keep_locally = false
}

resource "docker_container"  "ubuntu-container" {
   name = "c1"
   image = docker_image.ubuntu_image.id
}
   

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {

}

resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}

resource "docker_container" "ubuntu" {
  name  = "foo"
  image = docker_image.ubuntu.image_id
  command = ["/usr/bin/sleep","1000"]
}

resource "docker_image" "httpd" {
  name = "httpd:latest"
}

resource "docker_container" "httpd" {
  name  = "myhttpd"
  image = docker_image.httpd.image_id
  ports {
	internal = "80"
	external = "9099"
  }
}

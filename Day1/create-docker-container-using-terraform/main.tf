resource "docker_image" "ubuntu_image" {
   name = "ubuntu:22.04"
   keep_locally = false
}

resource "docker_container"  "ubuntu-container" {
   name = "c1"
   image = docker_image.ubuntu_image.image_id
   command = [ "/bin/bash", "-c", "sleep 9999999" ] 
}

resource "docker_container"  "ubuntu-container2" {
   name = "c2"
   image = docker_image.ubuntu_image.image_id
   command = [ "/bin/bash", "-c", "sleep 9999999" ] 
}
   

resource "random_string" "random" {
  count   = var.count_in
  length  = 4
  special = false
  upper   = false
}

resource "docker_container" "app_container" {
  count = var.count_in
  name  = join("-", [var.name_in, terraform.workspace, random_string.random[count.index].result])
  image = var.image_in
  ports {
    internal = var.int_port_in
    external = var.ext_port_in[count.index]
  }
  dynamic "volumes" {
    for_each = var.volumes_in
    content {
      container_path = volumes.value["container_path_each"]
      volume_name    = module.volume[count.index].volume_output[volumes.key]
    }
  }
  provisioner "remote-exec" {
    # Add a file with containers name, ip and port on creation. Delete file on destroy.
    connection {
      host        = "x.x.x.x"
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("../../id_rsa")
    }
    inline = [
      "echo ${self.name}: ${self.network_data[0].ip_address}:${join("", [for x in self.ports[*]["external"] : x])} >> /home/ubuntu/environment/containers.txt"
    ]
  }
  provisioner "remote-exec" {
    when       = destroy
    on_failure = continue
    connection {
      host        = "x.x.x.x"
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("../../id_rsa")
    }
    inline = [
      "rm -f /home/ubuntu/environment/containers.txt"
    ]
  }
}

module "volume" {
  source       = "./volume"
  count        = var.count_in
  volume_count = length(var.volumes_in)
  volume_name  = "${var.name_in}-${terraform.workspace}-${random_string.random[count.index].result}-volume"
}
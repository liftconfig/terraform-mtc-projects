resource "docker_volume" "container_volume" {
  count = var.volume_count
  name  = "${var.volume_name}-${count.index}"
  lifecycle {
    prevent_destroy = false
  }
  provisioner "remote-exec" {
    # backup volume before destroying container
    when       = destroy
    on_failure = continue
    connection {
      host        = "x.x.x.x"
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("../../id_rsa")
    }
    inline = [
      "mkdir /home/ubuntu/environment/backup/"
    ]
  }
  provisioner "remote-exec" {
    when       = destroy
    on_failure = fail
    connection {
      host        = "x.x.x.x"
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("../../id_rsa")
    }
    inline = [
      "sudo tar -czvf /home/ubuntu/environment/backup/${self.name}.tar.gz ${self.mountpoint}/"
    ]
  }
}
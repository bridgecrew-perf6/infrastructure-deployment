resource "yandex_compute_disk" "fileserver-disk" {
  name = "fileserver-disk"
  type = "network-ssd"
  zone = var.zone
  size = 100
}

resource "yandex_compute_instance" "fileserver" {
  name     = "fileserver"
  hostname = "fileserver"
  zone     = var.zone

  resources {
    cores  = 8
    memory = 56
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.image.id
    }
  }

  secondary_disk {
    disk_id = yandex_compute_disk.fileserver-disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.ssh_credentials.user}:${file(var.ssh_credentials.pub_key)}"
  }
}

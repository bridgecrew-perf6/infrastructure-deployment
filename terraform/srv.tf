resource "yandex_compute_instance" "srv" {
  name     = "srv"
  hostname = "srv"
  zone     = var.zone

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.image.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.ssh_credentials.user}:${file(var.ssh_credentials.pub_key)}"
  }
}

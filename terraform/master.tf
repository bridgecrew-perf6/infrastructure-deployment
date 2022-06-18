resource "yandex_compute_instance" "master" {
  name     = "k8s-master-0"
  hostname = "k8s-master-0"
  zone     = var.zone

  resources {
    cores  = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.image.id
      size     = 15
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

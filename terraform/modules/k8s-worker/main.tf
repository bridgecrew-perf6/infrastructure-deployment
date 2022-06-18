data "yandex_compute_image" "image" {
  family = var.instance_family_image
}

resource "yandex_compute_instance" "k8s_worker" {
  count    = var.workers
  name     = "k8s-worker-${count.index}"
  hostname = "k8s-worker-${count.index}"

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
    subnet_id = var.vpc_subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.ssh_credentials.user}:${file(var.ssh_credentials.pub_key)}"
  }
}

provider "yandex" {
  token     = var.auth_token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_vpc_network" "network" {
  name = "k8s-network"
}

resource "yandex_vpc_subnet" "subnet" {
  v4_cidr_blocks = ["192.168.10.0/24"]
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
}

data "yandex_compute_image" "image" {
  family = var.instance_family_image
}

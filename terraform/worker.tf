module "k8s-worker" {
  source        = "./modules/k8s-worker"
  vpc_subnet_id = yandex_vpc_subnet.subnet.id
}

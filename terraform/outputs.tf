output "external_ip_address_k8s_master" {
  value = yandex_compute_instance.master.network_interface.0.nat_ip_address
}

output "external_ip_address_k8s_worker" {
  value = module.k8s-worker[*].external_ip_address
}

output "external_ip_address_srv" {
  value = yandex_compute_instance.srv.network_interface.0.nat_ip_address
}

output "external_ip_address_fileserver" {
  value = yandex_compute_instance.fileserver.network_interface.0.nat_ip_address
}

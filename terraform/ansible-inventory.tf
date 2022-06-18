resource "local_file" "ansible_inventory" {
  content = templatefile("templates/ansible_inventory.tmpl", {
    master       = yandex_compute_instance.master.network_interface.0.nat_ip_address,
    workers      = module.k8s-worker.external_ip_address,
    srv          = yandex_compute_instance.srv.network_interface.0.nat_ip_address,
    fileserver   = yandex_compute_instance.fileserver.network_interface.0.nat_ip_address,
    ansible_user = var.ssh_credentials.user
  })
  filename = "../ansible/hosts"

  depends_on = [
    yandex_compute_instance.master,
    module.k8s-worker,
    yandex_compute_instance.srv,
    yandex_compute_instance.fileserver
  ]
}

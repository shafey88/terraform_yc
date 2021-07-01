output "internal_ip_address_elk_1" {
  value = "${yandex_compute_instance.elk-1.network_interface.0.ip_address}"
}

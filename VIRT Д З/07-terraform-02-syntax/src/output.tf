output "zone_yandex" {
  value       = yandex_compute_instance.khrom.zone

  
}

output "subnet_id" {
  value       = resource.yandex_vpc_subnet.subnet.id

}

output "ip_private_khrom" {
  value       = yandex_compute_instance.khrom.network_interface.0.ip_address

}

output "ip_external_khrom" {
  value       = yandex_compute_instance.khrom.network_interface.0.nat_ip_address

}

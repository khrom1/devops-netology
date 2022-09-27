resource "yandex_dns_zone" "zone1" {
  name   = "okhranka-zone"
  zone   = "${var.domain}."
  public = true
}

resource "yandex_dns_recordset" "rs1" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "${var.domain}."
  type    = "A"
  ttl     = 200
  data    = [" ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address} "]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "rs2" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "www"
  type    = "A"
  ttl     = 200
  data    = [" ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address} "]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "rs3" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "gitlab"
  type    = "A"
  ttl     = 200
  data    = [" ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address} "]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "rs4" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "grafana"
  type    = "A"
  ttl     = 200
  data    = [" ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address} "]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "rs5" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "prometheus"
  type    = "A"
  ttl     = 200
  data    = [" ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address} "]
  depends_on = [yandex_compute_instance.nginx]
}

resource "yandex_dns_recordset" "rs6" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "alertmanager"
  type    = "A"
  ttl     = 200
  data    = [" ${yandex_compute_instance.nginx.network_interface.0.nat_ip_address} "]
  depends_on = [yandex_compute_instance.nginx]
}



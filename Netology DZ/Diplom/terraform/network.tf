resource "yandex_vpc_network" "net" {
  name = "network"
}


resource "yandex_vpc_route_table" "nat" {
  name = "nat"
  network_id = "${yandex_vpc_network.net.id}"

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = "172.20.1.21"

  }
}


resource "yandex_vpc_subnet" "subnet1" {
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.net.id}"
  route_table_id = "${yandex_vpc_route_table.nat.id}"
  v4_cidr_blocks = ["172.20.1.0/24"]
}

resource "yandex_vpc_subnet" "subnet2" {
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.net.id}"
  route_table_id = "${yandex_vpc_route_table.nat.id}"
  v4_cidr_blocks = ["172.20.2.0/24"]
}

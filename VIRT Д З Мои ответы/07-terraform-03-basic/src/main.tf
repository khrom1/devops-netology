provider "yandex"  {
  service_account_key_file = "key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
  zone      = "ru-central1-a"
}


data "yandex_compute_image" "ubuntu-2004-lts" {
  family = "ubuntu-2004-lts"
}

resource "yandex_vpc_network" "network" {
  name = "network"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet"
  network_id     = resource.yandex_vpc_network.network.id
  v4_cidr_blocks = ["172.20.15.0/24"]
  zone           = "ru-central1-a"
}

resource "yandex_compute_instance" "vm-v1" {
  count = "${terraform.workspace == "stage" ? 1 : 2}"
  name = "v-stage-${count.index}-${terraform.workspace}"
  
  


  resources {
    cores         = "${terraform.workspace == "stage" ? 2 : 4}"
    memory        = "${terraform.workspace == "stage" ? 2 : 4}"

  }

  boot_disk {
    initialize_params {
      image_id = "${var.ubuntu-2004-lts}"
      type     = "network-hdd"
      size     = "15"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
 } 

  locals {
  for = toset([
    "node0",
    "node1",
  ])
}

resource "yandex_compute_instance" "vm-v2" {
  for_each = local.for
  name = "v-for-${each.key}-${terraform.workspace}"
   
   
   resources {
    cores  = "2"
    memory = "2"
  }
  
   boot_disk {
    initialize_params {
      image_id = "${var.ubuntu-2004-lts}"
      type     = "network-hdd"
      size     = "15"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}


 

resource "yandex_compute_instance" "db01" {
  name                      = "db01"
  hostname                  = "db01.okhanka.ru"
  zone                      = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 6
    core_fraction = 20
  }

    boot_disk {
        initialize_params {
          image_id    = "fd8c00efhiopj3rlnlbn"
          size        = 10
        }
      }

    network_interface {
     subnet_id = yandex_vpc_subnet.subnet1.id
      ip_address  = "172.20.1.22"
      nat       = false

    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
    }
    
    
    resource "yandex_compute_instance" "db02" {
  name                      = "db02"
  hostname                  = "db02.okhanka.ru"
  zone                      = "ru-central1-b"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 6
    core_fraction = 20
  }

    boot_disk {
        initialize_params {
          image_id    = "fd8c00efhiopj3rlnlbn"
          size        = 10
        }
      }

    network_interface {
     subnet_id = yandex_vpc_subnet.subnet2.id
      ip_address  = "172.20.2.22"
      nat       = false

    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
    }

resource "yandex_compute_instance" "runner" {
  name                      = "runner"
  hostname                  = "runner.okhanka.ru"
  zone                      = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
    core_fraction = 20
  }

    boot_disk {
        initialize_params {
          image_id    = "${var.image_id}"
          size        = 10
        }
      }

    network_interface {
     subnet_id = yandex_vpc_subnet.subnet1.id
      ip_address  = "172.20.1.25"
      nat       = false

    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
    }

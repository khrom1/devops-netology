resource "yandex_compute_instance" "gitlab" {
  name                      = "gitlab"
  hostname                  = "gitlab.okhanka.ru"
  zone                      = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 6
    core_fraction = 20
  }

    boot_disk {
        initialize_params {
          image_id    = "${var.image_id}"
          size        = 20
        }
      }

    network_interface {
      subnet_id = yandex_vpc_subnet.subnet1.id
      ip_address  = "172.20.1.26"
      nat       = false

    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
    }

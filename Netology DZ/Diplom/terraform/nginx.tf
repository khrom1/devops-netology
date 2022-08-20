resource "yandex_compute_instance" "nginx" {
  name                      = "nginx"
  hostname                  = "nginx.okhanka.ru"
  zone                      = "ru-central1-a"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
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
      nat       = true

    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
    }
    }

# Provider
terraform {
  required_providers {
    yandex = {
       source  = "yandex-cloud/yandex"
      version = "~> 0.7"
    }
  }
    required_version = ">= 0.13"

    backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "s3-khrom"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "МОЙ Ключ"
    secret_key = "МОЙ Ключ"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}


provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "${var.cloud_id}"
  folder_id = "${var.folder_id}"
}

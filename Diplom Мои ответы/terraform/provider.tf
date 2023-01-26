# Provider
terraform {
  required_providers {
    yandex = {
       source  = "yandex-cloud/yandex"
      version = "= 0.80.0"
    }
  }
    required_version = "= 1.3.0"

    backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "s3-khrom"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "YCAJElnOsOeMFVerckVm2wbXT"
    secret_key = "YCMTXgBmYEun5t2tJ02qSFAqww2UY5C96cJzvpA_"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}


provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "${var.cloud_id}"
  folder_id = "${var.folder_id}"
}

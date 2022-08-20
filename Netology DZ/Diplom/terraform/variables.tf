
variable "cloud_id" {
  default = "b1ganj8ti9k5rtlok7s3"
}


variable "folder_id" {
  default = "b1g0nmleb1hnugk4kb9g"
}


variable "image_id" {
  default = "fd88tmhiaal0or2k67ee"
}

variable "zone1" {
  type = string
  default = "ru-central1-a"
}

variable "zone2" {
  type = string
  default = "ru-central1-b"
}

variable "core_fraction" {
  type = number
  default = 20
}

variable "domain" {
  type = string  
  default = "okhranka.ru"
}

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.75.0"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    region     = "ru-central1"
    key        = "s3/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

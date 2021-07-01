provider "yandex" {
  token          = "var.token_yc"
  cloud_id       = "var.cloude_id"
  folder_id      = "var.folder_id"
  zone           = "var.zone_id"
}

resource "yandex_compute_instance" "elk-1" {
  name           = "elk"

  resources {
    cores        = 1
    memory       = 1
  }

  boot_disk {
    initialize_params {
      image_id    = "var.image_id"
    }
  }

  network_interface {
    subnet_id     = "${yandex_vpc_subnet.intranet-12-ru-central1-b.id}"
    nat           = true
  }

  metadata = {
    user-data     ="${file("C:/meta.txt")}"
  }
}

resource "yandex_vpc_network" "company" {
  name            = "company"
}
 
resource "yandex_vpc_subnet" "intranet-12-ru-central1-b" {
 name            = "intranet-12-ru-central1-b"
 zone            = "var.zone_id"
 network_id      = "${yandex_vpc_network.company.id}"
 v4_cidr_blocks  = ["10.0.0.0/24"]
}

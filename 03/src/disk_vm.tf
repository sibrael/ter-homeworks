resource "yandex_compute_disk" "hdd-disk" {
  count = length(var.storages)
  name = "hdd-disk-${var.storages[count.index]}"
  size = 1
}

resource "yandex_compute_instance" "storage" {
  name        = var.storage
  platform_id = "standard-v1"
  depends_on = [
    yandex_compute_disk.hdd-disk
  ]
  resources {
    cores         = var.vms_resources.storage.cores
    memory        = var.vms_resources.storage.memory
    core_fraction = var.vms_resources.storage.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
    }
  }

/*   dynamic "secondary_disk" {
    for_each = "${yandex_compute_disk.hdd-disk.*.id}"
    content {
            disk_id = yandex_compute_disk.hdd-disk["${secondary_disk.key}"].id
    }
  } */

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.hdd-disk[*]
    content {
      disk_id = secondary_disk.value.id
      auto_delete = true
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = local.serial_port_enable
    ssh-keys           = local.id_rsa_key
  }
}

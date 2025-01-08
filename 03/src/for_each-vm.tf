resource "yandex_compute_instance" "db" {
  for_each = {for vm in var.each_vm: vm.vm_name => vm}
  name  = "netology-develop-platform-db-${each.value.vm_name}"
  platform_id = "standard-v1"
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type = "network-hdd"
      size = "${each.value.disk_volume}"
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
  }

  metadata = {
    serial-port-enable = local.serial_port_enable
    ssh-keys           = local.id_rsa_key
  }
}

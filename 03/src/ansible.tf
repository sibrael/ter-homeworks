resource "local_file" "inventory_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",
        {
        webservers      = yandex_compute_instance.example,
        databases   = yandex_compute_instance.db,
        storage     = [yandex_compute_instance.storage]
        })

  filename = "${abspath(path.module)}/inventory.yml"
}

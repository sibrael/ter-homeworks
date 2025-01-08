locals {
  id_rsa_key = "${file("~/.ssh/id_ed25519.pub")}"
  serial_port_enable = 1
}

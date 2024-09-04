variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image for Web"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "VM platform"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM name"
}

variable "vm_web_resources" {
  type        = map(object({
    cores = number
    memory = number
    core_fraction = number
  }))
  default = {
    "web" = {
      cores = 2
      memory = 1
      core_fraction = 5
  }
    "db" = {
      cores = 2
      memory = 2
      core_fraction = 20}}
  description = "VM resource config"
}

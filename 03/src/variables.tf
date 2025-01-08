###cloud vars
variable "token" {
  type        = string
  description = "---"
}

variable "cloud_id" {
  type        = string
  default = "b1g40slsj9pvhvgo3r5b"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1g9rgfing2h10u1r4qp"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone_a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr_a" {
  type        = list(string)
  default     = ["10.0.3.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_b" {
  type        = list(string)
  default     = ["10.0.4.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "each_vm" {
  type = list(object({
      vm_name=string,
      cpu=number,
      ram=number,
      disk_volume=number
      core_fraction=number
      }))
  default = [
    {
      vm_name = "main",
      cpu = 2,
      ram = 2,
      disk_volume = 10
      core_fraction = 5
    },
    {
      vm_name = "replica",
      cpu = 2,
      ram = 4,
      disk_volume = 12
      core_fraction = 5
    }
  ]
}

variable "storages" {
  type        = list(string)
  default     = ["1", "2", "3"]
}

variable "storage" {
  type        = string
  default     = "netology-develop-platform-storage"
  description = "storage name"
}

variable "vms_resources" {
  type=map(object({
    cores = number
    memory = number
    core_fraction = number
    hdd_size = number
    hdd_type = string
  }))
  default = {
    web = {
      cores=2
      memory=2
      core_fraction=5
      hdd_size=10
      hdd_type="network-hdd"
    }
    storage = {
      cores=2
      memory=1
      core_fraction=5
      hdd_size=5
      hdd_type="network-hdd"
    }
  }
}

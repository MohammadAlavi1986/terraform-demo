variable "location" {
  type = string
  default = "West Europe"
}

variable "resource_group_name" {
  type = string
  default = "example-resources"
}

variable "address_space" {
  type = string
  default = "192.168.0.0/16"
}

variable "subnets" {
  type = map(object({
    number = number
  }))
}

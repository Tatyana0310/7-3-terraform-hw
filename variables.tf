variable "flow" {
  type    = string
  default = "24-01"
}

variable "cloud_id" {
  type    = string
  default = "b1g75pmh7g47a76mmoqs"
}
variable "folder_id" {
  type    = string
  default = "b1ghnqv6na3vjnp9qu69"
}

variable "test" {
  type = map(number)
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }
}

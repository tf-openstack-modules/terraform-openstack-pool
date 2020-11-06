variable "name" {
  type=string
}

variable "protocol" {
  type=string
}

variable "lb_method" {
  type=string
}

variable "listener_id" {
  type=string
}

variable "members" {
  type = list(object({address=string, protocol_port=number, subnet_id=string}))
}
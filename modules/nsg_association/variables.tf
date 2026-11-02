variable "subnet_ids" {
  type = map(string)
}

variable "nsg_ids" {
  type = map(string)
}

variable "nsg_associations" {
  type = map(object({
    subnet_key = string
    nsg_key    = string
  }))
}

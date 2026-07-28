variable "rg_names" {
  type = map(object({
    name     = string
    location = string
  }))
}
variable "vpc_cidr" {
  description = "Vpc Cidr Block"
  type = string
}

variable "subnet_cidr" {
  description = "subnet cidr"
  type = list(string)
}

variable "subnet_names" {
  description = "subnet names"
  type = list(string)
}
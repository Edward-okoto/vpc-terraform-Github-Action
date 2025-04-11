variable "Sg_id" {
  description = "Security ID for EC2"
  type = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2"
  type = list(string)
}

variable "ec2_names" {
  description = "EC2 names"
  type = list(string)
  default = [ "Webserver1", "Webserver2" ]
}
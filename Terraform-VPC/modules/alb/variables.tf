variable "Sg_id" {
  description = "Sg ID for application Load Balancer"
  type = string
}

variable "subnet_id" {
  description = "Subnet ID for application Load Balancer"
  type = list(string)
}

variable "vpc_id" {
  description = "vpc ID for application Load Balancer"
  type = string
}

variable "ec2_instances" {
  description = "Instance IDs for target group attachment"
  type = list(string)
}
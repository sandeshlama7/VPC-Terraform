variable "subnets-conf" {
  description = "CIDR for Subnets"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "vpc" {
  description = "VPC Info"
  type = map(string)
}

variable "ec2" {
  description = "Instance Info"
  type = map(string)
}

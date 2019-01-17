variable "project" {}
variable "multi_az" {
  default = true
}
variable "rds" {
  default = true
}
variable "nat_mode" {
  // TODO allow to disable creation of any type nat
  description = "Could be 'gateway' or 'instance', read more: https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-nat-comparison.html"
  default = "gateway"
}

locals {
  nat_instance          = "${ var.nat_mode == "gateway" ? false : true }"
  nat_instance_multi_az = "${ local.nat_instance == false ? false : var.multi_az }"

  nat_gw                = "${ var.nat_mode == "gateway" ? true : false }"
  nat_gw_multi_az       = "${ local.nat_gw == false ? false : var.multi_az }"
}

variable "nat_instance_type" {
  default = "t2.small"
}
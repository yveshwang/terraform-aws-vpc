output "subnet_public_1" {
  value = "${aws_subnet.public_nat_1.id}"
}
output "subnet_public_2" {
  value = "${aws_subnet.public_nat_2.id}"
}
output "subnet_private_1" {
  value = "${aws_subnet.private_app_1.id}"
}
output "subnet_private_2" {
  value = "${var.multi_az ? join("",aws_subnet.private_app_2.*.id) : ""}"
}
output "subnet_rds_1" {
  value = "${var.rds ? join("",aws_subnet.private_rds_1.*.id) : ""}"
}
output "subnet_rds_2" {
  value = "${var.rds ? join("",aws_subnet.private_rds_2.*.id) : ""}"
}
output "db_subnet_group" {
  value = "${var.rds ? join("",aws_db_subnet_group.default.*.name) : ""}"
}
output "nat_gw_ip_1" {
  value = "${local.nat_gw ? join("", aws_eip.nat_1.*.public_ip) : ""}"
}
output "nat_gw_ip_2" {
  value = "${local.nat_gw_multi_az ? join("", aws_eip.nat_2.*.public_ip) : ""}"
}
output "nat_instance_ip_1" {
  value = "${local.nat_instance ? join("", aws_instance.nat_1.*.public_ip) : ""}"
}
output "nat_instance_ip_2" {
  value = "${local.nat_instance_multi_az ? join("", aws_instance.nat_2.*.public_ip) : ""}"
}
output "vpc_id" {
  value = "${aws_vpc.project.id}"
}
output "default_security_group" {
  value = "${aws_vpc.project.default_security_group_id}"
}
output "bastion_pub_ip" {
  value = "${aws_instance.bastion_in_public.public_ip}"
}
output "bastion_pub_aws_dns" {
  value = "${aws_instance.bastion_in_public.public_dns}"
}
output "test_priv_public_ip" {
  value = "${aws_instance.test_private.public_ip}"
}
output "test_priv_private_ip" {
  value = "${aws_instance.test_private.private_ip}"
}

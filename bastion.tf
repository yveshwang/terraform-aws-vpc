# bastion
# yh 17.01.2018

resource "aws_instance" "bastion_in_public" {
  ami = "ami-0bdf93799014acdc4"
  associate_public_ip_address = "true"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.yves.key_name}"
  vpc_security_group_ids = [ "${aws_security_group.ssh_access.id}"]
  subnet_id = "${aws_subnet.public_nat_1.id}"
  depends_on = ["aws_internet_gateway.default"]
}

resource "aws_instance" "test_private" {
  ami = "ami-0bdf93799014acdc4"
  associate_public_ip_address = "true"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.yves.key_name}"
  vpc_security_group_ids = [ "${aws_security_group.ssh_access.id}"]
  subnet_id = "${aws_subnet.private_app_1.id}"
  depends_on = ["aws_internet_gateway.default"]
}

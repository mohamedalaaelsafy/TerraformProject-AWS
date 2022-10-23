variable "ec2_names" {
  default = ["server_public","server_public"]
}


resource "aws_instance" "ec2" {
  count = 2
  instance_type     = "t2.micro"
  availability_zone = "${element(var.subnet_azs, count.index)}"
#   vpc_id = aws_vpc.name.id
  key_name = "CICD"
  tags = {
    Name = "${element(var.ec2_names, count.index)}"
  }
}
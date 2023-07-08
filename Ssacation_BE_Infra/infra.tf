# resource "aws_key_pair" "admin" {

#   key_name = "admin"
#   public_key = file("~/.ssh/admin.pub")
# }

# data "aws_security_group" "default" {

#   name = "default"
# }

# resource "aws_security_group" "ec2_ssacation_be" {

#   name = "allow_ports_from_all"
#   description = "Allow SSH HTTP HTTPS port from all"

#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port = 443
#     to_port = 443
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_instance" "ssacation_be" {

#   ami = "ami-0e6d55656282370af" # Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
#   instance_type = "t2.micro"
#   key_name = aws_key_pair.admin.key_name
#   vpc_security_group_ids = [
#     aws_security_group.ec2_ssacation_be.id,
#     data.aws_security_group.default.id
#   ]
# }

# resource "aws_db_instance" "ssacation_db" {
#   allocated_storage = 8
#   engine = "mysql"
#   engine_version = "8.0.32" # 사용하려는 DB 엔진 버전
#   instance_class = "db.t3.micro"
#   username = var.db_username
#   password = var.db_password
#   skip_final_snapshot = true
# }
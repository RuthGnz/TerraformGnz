variable "instance_tag" {}
variable "ACCESS_KEY" {}
variable "SECRET_KEY" {}

data "aws_instance" "created_instance" {

  filter {
    name   = "tag:Name"
    values = ["${var.instance_tag}"]
  }
}
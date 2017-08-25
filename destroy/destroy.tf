variable "instance_tag" {}


data "aws_instance" "search" {

  filter {
    name   = "tag:Name"
    values = ["${instance_tag}"]
  }
}
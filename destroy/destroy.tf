variable "instance_tag" {}


data "aws_instance" "created_instance" {

  filter {
    name   = "tag:Name"
    values = ["${instance_tag}"]
  }
}
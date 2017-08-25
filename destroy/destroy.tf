variable "instance_tag" {}


data "aws_instance" "${instance_tag}" {

  filter {
    name   = "tag:Name"
    values = ["${instance_tag}"]
  }
}
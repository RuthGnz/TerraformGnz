variable "instance_tag" {}
variable "ACCESS_KEY" {}
variable "SECRET_KEY" {}

provider "aws" {
  access_key = "${var.ACCESS_KEY}"
  secret_key = "${var.SECRET_KEY}"
  region     = "eu-west-1"
}

data "aws_instance" "created_instance" {

  filter {
    name   = "tag:Name"
    values = ["${var.instance_tag}"]
  }
}


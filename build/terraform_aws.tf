# Configure the AWS Provider
variable "ACCESS_KEY" {}
variable "SECRET_KEY" {}
variable "instance_tag" {}

provider "aws" {
  access_key = "${var.ACCESS_KEY}"
  secret_key = "${var.SECRET_KEY}"
  region     = "eu-west-1"
}

# Create a server
resource "aws_instance" "server" {
    ami           = "ami-19896660"
    instance_type = "t2.micro"
    key_name="rgonzalez-aws"
    vpc_security_group_ids = ["${aws_security_group.jenkins_docker.id}"]

  	tags {
    	Name = "${instance_tag}"
  	}
}


resource "aws_security_group" "jenkins_docker" {
  name        = "jenkins_docker"
  description = "Port 8080"

  ingress {
  	from_port=8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "ip" {
  value = "${aws_instance.${instance_tag}.public_dns}"
}
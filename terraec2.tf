# set public key variable 
variable "public_key" {
    type=string
    default="~/.ssh/id_rsa.pub"
}

provider "aws" {
    profile = "default"
    region = "us-west-2"
}

# add key as resource
resource "aws_key_pair" "my-key" {
    key_name = "my-key"
    public_key = var.public_key
}

# define instance
resource "aws_instance" "example" {
    ami = "ami-06d51e91cea0dac8d" 
    instance_type = "t2.micro"
    key_name = "my-key"
    security_groups = ["${aws_security_group.allow-ssh.name}"]
}

# use ssh security group
resource "aws_security_group" "allow-ssh" {
    name = "allow-ssh"
    # SSH access
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

# output ssh command
output "command" {
  value = "ssh -i ~/.ssh/id_rsa ubuntu@${aws_instance.example.public_dns}"      
}




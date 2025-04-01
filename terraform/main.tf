provider "aws" {
    region = "us-east-1"
  
}


resource "aws_instance" "nodejs" {
    instance_type = "t2.micro"
    ami = "ami-084568db4383264d4"
    key_name = aws_key_pair.key.key_name
    vpc_security_group_ids = [aws_security_group.sgnode.id]
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      private_key = abs()
      timeout = "4m"
    }
    tags = {
      "name" = "nodejs"
    }
}
resource "aws_iam_instance_profile" "ec2" {
    name = "ec2"
    role = "ec2ecr"
  
}

resource "aws_key_pair" "key" {
    key_name = nodejs1
    public_key = var.public_key

  
}

resource "aws_security_group" "sgnode" {
    egress = [
        {
            
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 0
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        protocol = "-1"
        security_groups = []
        self = false
        to_port = 0

        }
    ]

    ingress = [
        {
            
        cidr_blocks = ["0.0.0.0/0",]
        from_port = 22
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        protocol = "tcp"
        security_groups = []
        self = false
        to_port = 22

        }
    ]
    }
  
output "public_ip" {
    value = aws_instance.nodejs.public_ip
  
}
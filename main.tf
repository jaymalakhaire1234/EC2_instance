resource "aws_instance" "myvm" {
    instance_type = var.instance_type
    ami = var.ami
  
}
resource "aws_key_pair" "mainkey" {
    key_name = var.key_name
    public_key = file(var.public_key)
  
}
resource "aws_security_group" "Example" {
    name = var.security_group
    vpc_id = var.vpc_id
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  
}
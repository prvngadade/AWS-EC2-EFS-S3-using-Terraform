# Creating a security group!
resource "aws_security_group" "ISG" {

  # Write description for the security group!
  description = "Allow HTTP Inbound Traffic"

  # Created an inbound rule for webserver to allow port 80, as webserver 
  # generally uses HTTP protocol which uses port 80!
  ingress {
    description = "HTTP for webserver"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Created an inbound rule for webserver to allow port 22 for SSH, 
  # because SSH protocol works on port 80!
  ingress {
    description = "SSH for webserver"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Created an outbound rule for webserver to allow traffic on all ports, & from 
  # all IP's in the world!
  egress {
    description = "ouput from webserver"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Adding a tag to the security group for its name!
  tags = {
    Name = "Project1"
  }
}

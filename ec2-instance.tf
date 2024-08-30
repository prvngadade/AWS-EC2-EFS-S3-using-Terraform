# Creating an AWS instance!
resource "aws_instance" "webserver" {
  
  # ami Id of the OS which has to be used for creating the AWS Instance.
  ami = "<AMI to be used>"
  
  # Instance type for the AWS Instance
  instance_type = "t2.micro"

  # Keyname and security group are obtained from the reference of their instances
  # created above dynamically!
  key_name = aws_key_pair.IntegrationKey.key_name
  
  # Here security groups has to be passed in list format for the proper functioning,
  # because there might be more than 1 security groups attached to one AWS EC2 isntance!
  security_groups =  [aws_security_group.ISG.name]


# Attaching a name to the AWS Instance!
  tags = {
   Name = "Webserver_From_Terraform"
  }

  # Establishing connection to the launched AWS instance!
  connection {
    
    # SSH protocol is used for accessing the AWS Instance!
    type = "ssh"
    user = "<User Name of the user which is used to access the AWS Instance>"
    private_key = file("<Path to the Key which is used to connect to AWS Instance>")
    
    # Public IP of the AWS Instance extracted dynamically for efficiency by taking 
    # reference from the variables.
    host = aws_instance.webserver.public_ip
  }

    #Assign EIP to aws instance
    resource "aws_eip" "lb" {
    instance = "aws_instance.webserver.id"
    vpc      =  "true"
}
}

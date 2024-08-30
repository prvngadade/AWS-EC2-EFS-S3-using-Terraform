# Creating a New Key
resource "aws_key_pair" "IntegrationKey" {
  
  # Name of the key which you want to use
  key_name   = "ProjectKey"
  
  # Here, I have used file function to extract my already created key from SSH
  #internally, but here random key created by you can also be entered, in
  # that case there is no need to use the file function!
  public_key = file("~/.ssh/id_rsa.pub")
  }

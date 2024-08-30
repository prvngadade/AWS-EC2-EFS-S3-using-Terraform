# Creating an EFS Volume
resource "aws_efs_file_system" "EFS_VOLUME" {
  creation_token = "Management & Scalability"
  tags = {
    Name = "XP3"
  }
}

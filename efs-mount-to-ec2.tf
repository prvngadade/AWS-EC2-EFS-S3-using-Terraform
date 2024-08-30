# Mounting the Drive to the AWS Instance
resource "null_resource" "mount_EFS_volume" {

  # Creating this dependency so that provisioner does 
  # not run before the volume attachment is done!
  depends_on = [
    aws_instance.webserver,
    aws_efs_file_system.EFS_VOLUME,
    aws_efs_mount_target.EFS_MOUNT,
  ]  

  # Creating a connection for mounting the drive using SSH
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/Downloads/GeneralKey.pem")
    host = aws_instance.webserver.public_ip
  }


  provisioner "remote-exec" {
    inline = [
      # Command to auto mount the EFS Volume to the EC2 instance after every restart!
        "sudo echo ${aws_efs_file_system.EFS_VOLUME.dns_name}:/ 
        /data/test efs defaults,_netdev 0 0 >> sudo /etc/fstab",
      
      # Command to mount the EFS volume to the instance!
        "sudo mount ${aws_efs_file_system.EFS_VOLUME.dns_name}:/ /data/test",
      ]
  }
}

# Creating a mount point for EFS Volume
resource "aws_efs_mount_target" "EFS_MOUNT" {
  depends_on = [
    aws_efs_file_system.EFS_VOLUME,
  ]
  
  # Assign the EFS File system here which is created in the step above!
  file_system_id = aws_efs_file_system.EFS_VOLUME.id
  subnet_id      = aws_instance.webserver.subnet_id
  security_groups = [aws_security_group.ISG.id]
}

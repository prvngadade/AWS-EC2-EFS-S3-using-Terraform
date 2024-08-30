// Creating a S3 Bucket in AWS
resource "aws_s3_bucket" "Project1" {
  bucket = "webserverbucket"
  acl    = "private"
}

# Uplaoding an file/data into the S3 bucket
resource "aws_s3_bucket_object" "object" {
  
  # Bucket name is extracted dynamically in which the data has to
  # be uploaded!
  bucket = aws_s3_bucket.Project1.bucket
  
  # Name of the file which should be there in the S3 after 
  # uploading the file
  key    = "<name of the file>"
  
  # Path to the file which has to be uploaded
  source = "<File Path>"
}

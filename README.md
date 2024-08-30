# AWS-EC2-EFS-S3-using-Terraform

1. Setting up the Terraform Provider.
2. Creation of Key-Pair for AWS Instance.
3. Creation of Security-Group for AWS Instance.
4. Creating an EC2 instance.
5. Entering into EC2 Instance to install some software.
6.Creating an EFS volume.
7.Creating a Mount Point for the EFS volume.
8. Mounting the EFS volume to the EC2 instance.
9. Creating an S3 bucket with private access.
10. Uploading data into the S3 bucket.
11. Creating an OAI (Origin Access Identity) for the CloudFront distribution!
12. Creating an AWS CloudFront distribution for that data uploaded into the S3 bucket.
13. Creating an IAM Bucket Policy for CloudFront Distribution.
14. Applying the bucket policy to the S3 Bucket so that CloudFront Distribution can access the private contents of the S3 bucket.

# Commands Need to use 

terraform init
terraform plan
terraform validate
terraform apply

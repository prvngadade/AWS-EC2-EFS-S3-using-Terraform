#Creating an AWS CloudFront distribution for that data uploaded into the S3 bucket.
resource "aws_cloudfront_distribution" "s3_distribution" {
  
# Creating a origin for the CloudFront!
  origin {
    
    # Setting the domain name for the CloudFront Distribution, 
    # in which we have to pass the S3 bucket name to upload the data,
    # which is extracted dynamically.
    domain_name = aws_s3_bucket.Project1.bucket_regional_domain_name

    # Name of the CloudFront Distribution
    origin_id   = "< Name >"
  } 


  enabled             = true
  is_ipv6_enabled     = true
  comment             = "S3 Distribution!"
  
  # Name of the default object in the S3 bucket which has to picked
  # by default by CloudFront!
  default_root_object = "<Name of the file!>"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    
    # Name of the cloudfront distribution!
    target_origin_id = "<Name of the CloudFront Distribution!>"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    
    # Minimum Time to Live of the content on the edge locations!
    min_ttl                = 0
    
    # Default Time to Live of the content on the edge locations! 
    default_ttl            = 3600
    # Maximum Time to Live of the content on the edge locations!
    max_ttl                = 86400
  }

  
  # Have to provide restrictions block here, in this we can restrict any country 
  # if we want!
restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

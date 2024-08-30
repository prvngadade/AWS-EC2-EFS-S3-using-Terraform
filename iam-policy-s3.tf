# Creating an IAM bucket policy for the cloudfront distribution!
data "aws_iam_policy_document" "s3_policy" {
  depends_on = [
    aws_cloudfront_distribution.s3_distribution,
  ]
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.Project1.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [
        aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [
      aws_s3_bucket.Project1.arn]

    principals {
      type        = "AWS"
      identifiers = [
        aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }
}

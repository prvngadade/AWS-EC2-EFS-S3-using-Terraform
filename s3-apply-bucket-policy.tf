resource "aws_s3_bucket_policy" "Project1_Bucket_Policy" {
  bucket = aws_s3_bucket.Project1.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

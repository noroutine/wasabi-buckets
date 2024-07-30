{
  "Effect": "Allow",
  "Action": [
    "s3:Get*",
    "s3:List*"
  ],
  "Resource": "arn:aws:s3:::${bucket}/*",
  "Principal": ${jsonencode({
      "AWS": [for arn in arns : "${arn}"]
    })
  }
}
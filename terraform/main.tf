provider aws {
  region = "${var.aws_region}"
}

resource "aws_s3_bucket" "website" {
  bucket = "${var.bucket_name}"
  acl    = "public-read"

  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${var.bucket_name}/*"]
    }
  ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# tfsec 検知用
resource "aws_s3_bucket" "sample/sub/bucket" {
  acl = "public-read"
}
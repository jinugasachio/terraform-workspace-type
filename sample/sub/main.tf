resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# tfsec 検知用
resource "aws_s3_bucket" "sample_sub_bucket" {
  acl = "public-read"
}

# tflint 検知用
resource "aws_instance" "foo" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t3.small"
}
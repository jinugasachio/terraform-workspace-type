resource "aws_vpc" "e" {
  cidr_block = "10.0.0.0/16"
}

# tfsec 検知用
resource "aws_s3_bucket" "sample_sub_bucket" {
  acl = "public-read"
}

# tflint 検知用
// resource "aws_instance" "goo" {
//   ami           = "ami" invalid AMI ID. (aws_instance_invalid_ami)
//   instance_type = "t3.small"
// }
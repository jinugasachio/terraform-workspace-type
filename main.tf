// resource "aws_vpc" "exa" {
//   cidr_block = "10.0.0.0/16"
// }

// # tfsec 検知用
resource "aws_s3_bucket" "bucket" {
  acl = "public-read"
}

# tflint検知用
// resource "aws_instance" "foo" {
//   ami           = "ami-0ff8a91507f77f867" #invalid AMI ID. (aws_instance_invalid_ami)
//   instance_type = "t3.small"
// }
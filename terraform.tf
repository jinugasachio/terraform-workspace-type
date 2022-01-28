terraform {
  required_version = "1.1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.0"
    }
  }

  backend "s3" {
    bucket = "terraform-workspace-type" # 私用アカウント
    key    = "terraform-workspace-type"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

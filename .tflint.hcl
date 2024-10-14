config {
  # ここは "./.tflint.d/plugins" にしてリポジトリに含めた方が良かったりするのか？わからん
  plugin_dir          = "~/.tflint.d/plugins"
  module              = true
  force               = false
  disabled_by_default = false
}

plugin "aws" {
  enabled    = true
  deep_check = true
  region     = "ap-northeast-1"
  version    = "0.34.0"
  source     = "github.com/terraform-linters/tflint-ruleset-aws"
}

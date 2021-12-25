# circleci ユーザーのcredential は terrafromで管理せずコンソール上から作成する
# 仮に作りたくなったらこちら https://qiita.com/reflet/items/dc109d1856b1ea525284 

resource "aws_iam_user" "circleci" {
  name = "circleci"
  path = "/"
}

resource "aws_iam_user_policy" "circleci" {
  name = "circleci_policy"
  user = aws_iam_user.circleci.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "sts:AssumeRole"
        Effect   = "Allow"
        Resource = aws_iam_role.administrator.arn
      }
    ]
  })
}

resource "aws_iam_role" "administrator" {
  name = "administrator"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = aws_iam_user.circleci.arn
        }
      }
    ]
  })
}

data "aws_iam_policy" "administrator_access" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "administrator" {
  role       = aws_iam_role.administrator.name
  policy_arn = data.aws_iam_policy.administrator_access.arn
}

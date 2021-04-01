resource "aws_iam_role_policy" "my_ec2-WEB_Policy" {
  name = "my_ec2-WEB_Policy"
  role = aws_iam_role.my_ec2-WEB_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "my_ec2-WEB_role" {
  name = "my_ec2-WEB_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "my_IAM_instance_profile" {
  name = "my_IAM_instance_profile"
  role = aws_iam_role.my_ec2-WEB_role.name
}
provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_iam_user" "user" {
    name = "Ec2s3administrator"

  
}

resource "aws_iam_policy" "mypolicy" {
    name = "Ec2s3adminpolicy"
    policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"s3:*",
				"ec2:*"
			],
			"Resource": "*"
		}
	]
}
    EOF
  
}

resource "aws_iam_policy_attachment" "attachpolicy" {
    name = "policyattach"
    users = [aws_iam_user.user.name ]
    policy_arn = aws_iam_policy.mypolicy.arn
  
}
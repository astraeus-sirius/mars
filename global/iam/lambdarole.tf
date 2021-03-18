resource "aws_iam_role" "instance_launch_automation" {
  name = "Instance-Launch-Automation"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com", 
          "ssm.amazonaws.com"
        ]
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "instance_launch_automation" {
  name = "Instance-Launch-Automation"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
              {
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction"
            ],
            "Resource": [
                "arn:aws:lambda:*:*:function:Automation*"
            ]
        },
        {
            "Action": [
              "ec2:DescribeInstances",
              "ec2:TerminateInstances",
              "ec2:CreateTags",
              "ec2:DeleteTags",
              "ec2:DescribeTags",
              "ec2:DescribeInstanceStatus",
              "ec2messages:*",
              "ec2:CreateImage",
              "ec2:CopyImage",
              "ec2:DeregisterImage",
              "ec2:DescribeImages",
              "ec2:DeleteSnapshot",
              "ec2:StartInstances",
              "ec2:RunInstances",
              "ec2:StopInstances",
              "ec2:TerminateInstances",
              "ec2:CreateTags",
              "ec2:DeleteTags",
              "ec2:DescribeTags",
              "iam:PassRole",
              "ssm:*",
              "cloudwatch:PutMetricData",
              "ds:DescribeDirectories",
              "logs:*",
              "cloudformation:CreateStack",
              "cloudformation:DescribeStackEvents",
              "cloudformation:DescribeStacks",
              "cloudformation:UpdateStack",
              "cloudformation:DeleteStack"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "logs:*"
            ],
            "Resource": "arn:aws:logs:*:*:*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "ec2:Create*",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DeleteNetworkInterface",
                "ec2:DetachNetworkInterface"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Effect": "Allow",
            "Action": [
                "sns:Publish"
            ],
            "Resource": [
                "arn:aws:sns:*:*:Automation*"
            ]
        }
        
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_basic_policy_attachment" {
    role       = "${aws_iam_role.instance_launch_automation.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "lambda_main_policy_attachment" {
    role       = "${aws_iam_role.instance_launch_automation.name}"
    policy_arn = "${aws_iam_policy.instance_launch_automation.arn}"
}

output "instance_launch_automation" {
  description = "ARN of instance_launch_automation  IAM role"
  value       = aws_iam_role.instance_launch_automation.arn
}
resource "aws_iam_role" "EC2DomainJoin" {
  name = "EC2DomainJoin"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Principal": {
        "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
    }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "EC2DomainJoin_AmazonSSMDirectoryServiceAccess" {
  role       = "${aws_iam_role.EC2DomainJoin.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMDirectoryServiceAccess"
}

resource "aws_iam_role_policy_attachment" "EC2DomainJoin_AmazonSSMManagedInstanceCore" {
  role       = "${aws_iam_role.EC2DomainJoin.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "EC2DomainJoin_AmazonSSMFullAccess" {
  role       = "${aws_iam_role.EC2DomainJoin.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_role_policy_attachment" "EC2DomainJoin_AmazonS3FullAccess" {
  role       = "${aws_iam_role.EC2DomainJoin.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

// resource "aws_iam_role_policy_attachment" "EC2DomainJoin_AmazonSSMAutomationRole" {
//   role       = "${aws_iam_role.EC2DomainJoin.name}"
//   policy_arn = "arn:aws:iam::aws:policy/AmazonSSMAutomationRole"
// }

resource "aws_iam_instance_profile" "EC2DomainJoin" {
  name = "EC2DomainJoin"
  role = "${aws_iam_role.EC2DomainJoin.name}"
}
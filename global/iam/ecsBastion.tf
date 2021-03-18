resource "aws_iam_role" "EC2Bastion" {
  name = "EC2Bastion"

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

resource "aws_iam_role_policy_attachment" "EC2Bastion_AdministratorAccess" {
  role       = "${aws_iam_role.EC2Bastion.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "EC2Bastion" {
  name = "EC2Bastion"
  role = "${aws_iam_role.EC2Bastion.name}"
}
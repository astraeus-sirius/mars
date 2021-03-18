#instance for jenkins
resource "aws_instance" "jenkins" {
  ami                         = "${data.aws_ami.bastion.id}"
  instance_type               = "t2.medium"
  associate_public_ip_address = true
  iam_instance_profile        = "EC2Bastion"
  subnet_id                   = "${data.terraform_remote_state.vpc.outputs.public_subnets[0]}"
  key_name                    = "us-east-2"
  security_groups             = ["${data.terraform_remote_state.vpc.outputs.bastion_security_group_id}"]
  user_data                   = filebase64("user-data-jenkins.txt")
  lifecycle {
      create_before_destroy = true
      ignore_changes = [security_groups]
    }
  tags = var.jenkins_tags
}

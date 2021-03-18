resource "aws_instance" "terraform" {
  ami                         = "${data.aws_ami.bastion.id}"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  #iam_instance_profile        = "EC2Bastion"
  subnet_id                   = "${data.terraform_remote_state.vpc.outputs.public_subnets[0]}"
  key_name                    = "us-east-2"
  security_groups             = ["${data.terraform_remote_state.vpc.outputs.bastion_security_group_id}"]
  user_data                   = filebase64("user-data.txt")
  lifecycle {
      create_before_destroy = true
      ignore_changes = [security_groups]
    }
  tags = var.terraform_tags
}
resource "aws_eip" "bastion" {
  vpc      = true
}

resource "aws_eip_association" "eip_assoc_terraform" {
  instance_id   = "${aws_instance.terraform.id}"
  allocation_id = "${aws_eip.bastion.id}"
    lifecycle {
      create_before_destroy = true
    }
}
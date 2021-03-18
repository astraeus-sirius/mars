#Launch instance
resource "aws_instance" "AWG_Dev" {
  ami                         = "${data.aws_ami.image.id}"
  instance_type               = "t2.large"
  associate_public_ip_address = true
  subnet_id                   = "${data.terraform_remote_state.vpc.outputs.public_subnets[0]}"
  key_name                    = "iasdev"
  security_groups             = ["${data.terraform_remote_state.vpc.outputs.awg_web_server_ports_security_group_id}"]
  #user_data                   = filebase64("user-data-sftp.txt")
  lifecycle {
      create_before_destroy = true
    #  ignore_changes = [security_groups]
    }
  tags = var.AWG_DEV_Tags
}

resource "aws_eip" "AWG_Dev" {
  vpc      = true
}

resource "aws_eip_association" "eip_assoc_dev" {
  instance_id   = "${aws_instance.AWG_Dev.id}"
  allocation_id = "${aws_eip.AWG_Dev.id}"
    // lifecycle {
    //   create_before_destroy = true
    // }
}
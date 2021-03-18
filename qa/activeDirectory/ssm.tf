resource "aws_ssm_document" "ias_ad_default_doc" {
	name  = "ias_ad_default_doc"
	document_type = "Command"

	content = "${data.template_file.ssm_doc.rendered}"

	depends_on = ["aws_directory_service_directory.ias_ad"]
}
resource "aws_ssm_association" "ias_bastion" {
	name = "${aws_ssm_document.ias_ad_default_doc.name}"
   targets {
      key    = "InstanceIds"
      values = ["${data.terraform_remote_state.bastion.outputs.bastion_id}"]
   }
}
// resource "aws_ssm_association" "ias_jenkins" {
// 	name = "${aws_ssm_document.ias_ad_default_doc.name}"
//    targets {
//       key    = "InstanceIds"
//       values = ["${data.terraform_remote_state.jenkins.outputs.jenkins_id}"]
//    }
// }
resource "aws_ssm_association" "AWG_ASG0" {
  name = "${aws_ssm_document.ias_ad_default_doc.name}"

  targets {
    key    = "tag:aws:autoscaling:groupName"
    values = ["${data.terraform_remote_state.services.outputs.asg_name}"]
  }
}
resource "aws_ssm_association" "AWG_sftp" {
  name = "${aws_ssm_document.ias_ad_default_doc.name}"

  targets {
    key    = "InstanceIds"
    values = ["${data.terraform_remote_state.services.outputs.sftp_id}"]
  }
}
resource "aws_ssm_association" "AWG_ESearch" {
  name = "${aws_ssm_document.ias_ad_default_doc.name}"

  targets {
    key    = "tag:aws:autoscaling:groupName"
    values = ["${data.terraform_remote_state.esearch.outputs.asg_name}"]
  }
}
// resource "aws_ssm_association" "ias_terraform" {
// 	name = "${aws_ssm_document.ias_ad_default_doc.name}"
//    targets {
//       key    = "InstanceIds"
//       values = ["${data.terraform_remote_state.terraform.outputs.terraform_id}"]
//    }
// }
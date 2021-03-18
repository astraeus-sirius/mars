resource "aws_directory_service_directory" "ias_ad" {
	name     = "${var.dir_domain_name}"
	password =  base64decode("${var.dir_admin_password}")
	size     = "Large"
	vpc_settings {
		vpc_id = "${data.terraform_remote_state.vpc.outputs.vpc_id}"
		subnet_ids = [
			"${data.terraform_remote_state.vpc.outputs.private_subnets[0]}",
			"${data.terraform_remote_state.vpc.outputs.private_subnets[1]}"
		]
	}
	type     = "${var.dir_type}"
    
    lifecycle {
      create_before_destroy = true
      ignore_changes = ["password"]
    } 
}

resource "aws_route53_zone" "private" {
  name = "${var.dir_domain_name}"

  vpc {
    vpc_id = "${data.terraform_remote_state.vpc.outputs.vpc_id}"
  }
}
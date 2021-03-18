#This folder is for elastic search / simulcast search.
resource "aws_sns_topic" "ias_service_lifecycle" {
    name = "ias_service_lifecycle_dev"
}

resource "aws_iam_role" "ias_service-role" {
    name = "ias_service-role_esearch"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "autoscaling.amazonaws.com"
      },
      "Sid": ""
    }
  ]
}
EOF
}
resource "aws_autoscaling_policy" "bat" {
  name                   = "AWG-terraform-esearch"
  policy_type            = "StepScaling"
step_adjustment {
  scaling_adjustment          = -1
  metric_interval_lower_bound = 1.0
  metric_interval_upper_bound = 2.0
}

step_adjustment {
  scaling_adjustment          = 1
  metric_interval_lower_bound = 2.0
//   metric_interval_upper_bound = 3.0
}
  adjustment_type        = "ChangeInCapacity"
  estimated_instance_warmup = 50
  autoscaling_group_name = "${aws_autoscaling_group.AWG-autoscaling.name}"
  lifecycle {
      create_before_destroy = true
    } 
}


resource "aws_iam_role_policy" "ias_service-role_policy" {
    name = "ias_service-role_policy_dev"
    role = "${aws_iam_role.ias_service-role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "sns:Publish"
      ],
      "Resource": "${aws_sns_topic.ias_service_lifecycle.arn}"
    }
  ]
}
EOF
}
#Autoscaling Group
resource "aws_autoscaling_group" "AWG-autoscaling" {
    name                      = "${aws_launch_configuration.AWG-launchconfig.name}"
    vpc_zone_identifier       = [data.terraform_remote_state.vpc.outputs.private_subnets[0]]
    launch_configuration      = "${aws_launch_configuration.AWG-launchconfig.name}"
    wait_for_elb_capacity     = "1"
    min_size                  = 1
    max_size                  = 1 
    health_check_grace_period = 30
    health_check_type         = "ELB"
    force_delete              = true
    termination_policies      = ["OldestInstance"]
    tags                      = var.default_tags
    lifecycle {
      create_before_destroy   = true
    }
}
 resource "aws_autoscaling_schedule" "morning-esearch" {
   scheduled_action_name  = "morning-esearch"
   min_size               = 1
   max_size               = 1
   desired_capacity       = 1
   autoscaling_group_name = "${aws_autoscaling_group.AWG-autoscaling.name}"
   recurrence              = "00 13 * * 1-5" #Mon-Fri at 7AM EST
 }

 resource "aws_autoscaling_schedule" "night-esearch" {
   scheduled_action_name  = "night-esearch"
   min_size               = 0
   max_size               = 0
   desired_capacity       = 0
   autoscaling_group_name = "${aws_autoscaling_group.AWG-autoscaling.name}"
   recurrence             =  "00 23 * * 1-5" #Mon-Fri at 5PM EST
 }
resource "aws_launch_configuration" "AWG-launchconfig" {
    name = "ESearch-${data.aws_ami.esearch.id}-lc"
    image_id = "${data.aws_ami.esearch.id}"
    instance_type = "c5.large"
    iam_instance_profile = "EC2DomainJoin"
    security_groups = [data.terraform_remote_state.vpc.outputs.awg_web_server_ports_security_group_id]
    key_name = "us-east-2"
    user_data = filebase64("user-data.txt")
    lifecycle {
      create_before_destroy = true
    }
}
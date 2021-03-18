#output for AMI
output "ami_id" {
  value = "${data.aws_ami.image.id}"
}
 output "AWG_Web_Server_Dev_id" {
  value = aws_instance.AWG_Dev.id
}
output "awg_dev_private_dns" {
  description = "List of private DNS names assigned to the instances. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = concat(aws_instance.AWG_Dev.*.public_dns, [""])[0]
}
output "awg_dev_public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = concat(aws_instance.AWG_Dev.*.public_dns, [""])[0]
}
output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = concat(aws_instance.AWG_Dev.*.public_dns, [""])[0]
}

output "bastion_public_ip" {
  value = aws_eip.bastion.public_ip 
}
// output "password" {
//   value = "${rsadecrypt(aws_instance.bastion.password_data,file("~/us-east-2.pem"))}"
// }
output "bastion_id" {
  value = aws_instance.bastion.id
}
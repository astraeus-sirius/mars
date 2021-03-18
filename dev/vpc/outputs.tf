output "vpc_id" {
    value = module.vpc.vpc_id
}

output "private_subnets" {
    value = module.vpc.private_subnets
}

output "public_subnets" {
    value = module.vpc.public_subnets
}

output "default_security_group_id" {
    value = module.vpc.default_security_group_id
}

 output "awg_web_server_ports_security_group_id" {
    value = aws_security_group.awg_web_server_ports.id
 }

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}
// output "bastion_security_group_id" {
//     value = aws_security_group.awg_bastion.id
// }
// output "intranet_security_group_id" {
//     value = aws_security_group.intranet.id
// }
 output "sftp_security_group_id" {
    value = aws_security_group.sftp.id
}

// output "awg_rds_security_group_id" {
//     value = aws_security_group.awg_rds.id
// }

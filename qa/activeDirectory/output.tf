 output "active_directory_id" {
      value = aws_directory_service_directory.ias_ad.id
 }

output "active_directory_ips" {
  value = join(", ", "${aws_directory_service_directory.ias_ad.dns_ip_addresses}")
}
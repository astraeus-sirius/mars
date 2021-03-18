  
output "acm_certificate_arn_awg" {
  description = "arn of acm certificate"
  value       = "${aws_acm_certificate.autoremarketers_com.arn}"
}
output "awg_output"{
  value = aws_acm_certificate.autoremarketers_com.domain_validation_options.0.resource_record_value
}
output "awglb_cert"{
  value = aws_acm_certificate.autoremarketers_com.domain_validation_options.0.resource_record_name
}
output "acm_certificate_arn_marketplace" {
  value = "${aws_acm_certificate.iasmarketplace_com.arn}"
}
output "awg_type" {
   value = aws_acm_certificate.autoremarketers_com.domain_validation_options.0.resource_record_type
 }
output "marketplace_output"{
  value = aws_acm_certificate.iasmarketplace_com.domain_validation_options.0.resource_record_value
}

output "marketplace_type" {
   value = aws_acm_certificate.iasmarketplace_com.domain_validation_options.0.resource_record_type
 }
output "marketplace_cert" {
  value = aws_acm_certificate.iasmarketplace_com.domain_validation_options.0.resource_record_name
}
output "awg_validation"{
  value = aws_acm_certificate_validation.cert.validation_record_fqdns
}
output "marketplace_validation"{
  value = aws_acm_certificate_validation.cert1.validation_record_fqdns
}
#SSL Cert Creation for awg
 resource "aws_acm_certificate" "autoremarketers_com" {
  domain_name       = "*.autoremarketers.com"
  validation_method = "DNS"
  tags = {
   Environment = "test"
 }
  lifecycle {
   create_before_destroy = true
 }
}
#Dyn Record creation for awg
resource "dyn_record" "cer_autoremarketers_com_validation" {
  zone  = "autoremarketers.com"
  name  = "${replace(aws_acm_certificate.autoremarketers_com.domain_validation_options.0.resource_record_name, "/(.autoremarketers.com.)$/", "")}"  
  value = "${aws_acm_certificate.autoremarketers_com.domain_validation_options.0.resource_record_value}"
  type  = "${aws_acm_certificate.autoremarketers_com.domain_validation_options.0.resource_record_type}"
  ttl   = 60
  depends_on = [aws_acm_certificate.autoremarketers_com]
}
 #Cert validation for awg
 resource "aws_acm_certificate_validation" "cert" {
   certificate_arn         = "${aws_acm_certificate.autoremarketers_com.arn}"
   validation_record_fqdns = ["${dyn_record.cer_autoremarketers_com_validation.fqdn}"]
   depends_on = [dyn_record.cer_autoremarketers_com_validation]
 }
 #SSL Cert Creation for marketplace
 resource "aws_acm_certificate" "iasmarketplace_com" {
  domain_name       = "*.iasmarketplace.com"
  validation_method = "DNS"
  tags = {
   Environment = "test"
 }
  lifecycle {
   create_before_destroy = true
 }
}

#Dyn Record creation for marketplace
resource "dyn_record" "cer_iasmarketplace_com_validation" {
  zone  = "iasmarketplace.com"
  name  = "${replace(aws_acm_certificate.iasmarketplace_com.domain_validation_options.0.resource_record_name, "/(.iasmarketplace.com.)$/", "")}"  
  value = "${aws_acm_certificate.iasmarketplace_com.domain_validation_options.0.resource_record_value}"
  type  = "${aws_acm_certificate.iasmarketplace_com.domain_validation_options.0.resource_record_type}"
  ttl   = 60
  depends_on = [aws_acm_certificate.iasmarketplace_com]
}
 #Cert validation for marketplace
 resource "aws_acm_certificate_validation" "cert1" {
   certificate_arn         = "${aws_acm_certificate.iasmarketplace_com.arn}"
   validation_record_fqdns = [dyn_record.cer_iasmarketplace_com_validation.fqdn]
   depends_on = [dyn_record.cer_iasmarketplace_com_validation]
 }
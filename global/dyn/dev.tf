#AWGLB Dyn Record creation
resource "dyn_record" "alb_dns_entry_dev" {
  zone  = "autoremarketers.com"
  name  = "awglb.dev"  
  value = "${data.terraform_remote_state.services-dev.outputs.awg_dev_private_dns}"
  type  = "CNAME"
  ttl   = 60
  #depends_on = [aws_lb.alb]
}
#MPAPI Dyn Record creation
resource "dyn_record" "alb_dns_entry_mpapi_dev" {
  zone  = "autoremarketers.com"
  name  = "mpapi.dev"  
  value = "${data.terraform_remote_state.services-dev.outputs.awg_dev_private_dns}"
  type  = "CNAME"
  ttl   = 60
  #depends_on = [aws_lb.alb]
}
#Live Auction Server Dyn Record creation
resource "dyn_record" "alb_dns_entry_las_dev" {
  zone  = "autoremarketers.com"
  name  = "awglblas.dev"  
  value = "${data.terraform_remote_state.services-dev.outputs.awg_dev_private_dns}"
  type  = "CNAME"
  ttl   = 60
}
#AWGLB Dyn Record creation
resource "dyn_record" "alb_dns_entry" {
  zone  = "autoremarketers.com"
  name  = "awglb"  
  value = "${data.terraform_remote_state.services.outputs.alb_dns_app}"
  type  = "CNAME"
  ttl   = 60
  #depends_on = [aws_lb.alb]
}
#MPAPI Dyn Record creation
resource "dyn_record" "alb_dns_entry_mpapi" {
  zone  = "autoremarketers.com"
  name  = "mpapi-qa"  
  value = "${data.terraform_remote_state.services.outputs.alb_dns_app}"
  type  = "CNAME"
  ttl   = 60
  #depends_on = [aws_lb.alb]
}
#Live Auction Server Dyn Record creation
resource "dyn_record" "alb_dns_entry_las" {
  zone  = "autoremarketers.com"
  name  = "awglblas"  
  value = "${data.terraform_remote_state.services.outputs.alb_dns_network}"
  type  = "CNAME"
  ttl   = 60
}
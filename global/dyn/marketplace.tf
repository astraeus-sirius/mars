#cname entry for in iasmarketplace
resource "dyn_record" "ice_dns_entry" {
  zone  = "iasmarketplace.com"
  name  = "icetestqa"  
  value = "${data.terraform_remote_state.services.outputs.alb_dns_app}"
  type  = "CNAME"
  ttl   = 60
}
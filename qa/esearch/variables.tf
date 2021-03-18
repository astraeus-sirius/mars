variable "region" {
    default = "us-east-2"
}
variable "default_tags" { 
    type = list(object({
    key = string
    value = string
    propagate_at_launch = bool
  }))
    default = [
    {
      key                 = "Name"
      value               = "AWG_ESearch_Server"
      propagate_at_launch = true
    },
    {
      key                 = "ID"
      value               = "02"
      propagate_at_launch = true
    },
    {
      key                 = "Environment"
      value               = "staging"
      propagate_at_launch = true
    },
  ]
}
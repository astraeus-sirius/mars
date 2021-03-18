locals {
  network_acls = {
    default_inbound = [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 1024
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
    default_outbound = [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 1024
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
    public_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 120
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "10.20.0.0/16"
      },
      {
        rule_number = 130
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = "udp"
        cidr_block  = "10.20.0.0/16"
      },
    ]
    public_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 120
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "10.20.0.0/16"
      },
      {
        rule_number = 130
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = "udp"
        cidr_block  = "10.20.0.0/16"
      },
    ]
    private_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "10.20.0.0/16"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = "udp"
        cidr_block  = "10.20.0.0/16"
      },
      {
        rule_number = 120
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 130
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
    private_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 120
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "10.20.0.0/16"
      },
      {
        rule_number = 130
        rule_action = "allow"
        from_port   = 1
        to_port     = 65535
        protocol    = "udp"
        cidr_block  = "10.20.0.0/16"
      },
    ]

  }
}

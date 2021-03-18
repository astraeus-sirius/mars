resource "aws_default_security_group" "default" {
  vpc_id = "${module.vpc.vpc_id}"
  #allow HTTP Traffic
  ingress {
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 80
    to_port   = 80
  }

  ingress {
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 443
    to_port   = 443
  }

  ingress {
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "awg_web_server_ports" {
  name        = "awg_web_server_ports"
  description = "Allow Required AWG Ports"
  vpc_id = "${module.vpc.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 135
    to_port     = 135
    protocol    = "tcp"
    cidr_blocks = ["10.30.0.0/16"]
  }

  ingress {
    from_port   = 139
    to_port     = 139
    protocol    = "tcp"
    cidr_blocks = ["10.30.0.0/16"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.30.0.0/16"]
  }
  ingress {
    from_port   = 445
    to_port     = 445
    protocol    = "tcp"
    cidr_blocks = ["10.30.0.0/16","172.31.21.29/32"]
  }
  ingress {
    from_port   = 587
    to_port     = 587
    protocol    = "tcp"
    cidr_blocks = ["10.30.0.0/16"]
  }
  ingress {
    from_port   = 1935
    to_port     = 1935
    protocol    = "tcp"
    cidr_blocks = ["10.30.0.0/16"]
  }
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.30.0.0/16"]
  }
  ingress {
    from_port   = 5985
    to_port     = 5985
    protocol    = "tcp"
    cidr_blocks = ["10.30.0.0/16", "172.31.0.0/24"]
  }
  ingress {
    from_port   = 8700
    to_port     = 8700
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 20000
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Andrew Public IP"
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = ["99.185.130.128/32"]
    }
  ingress {
    description = "Swapna Public IP"
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = ["183.83.64.52/32"]
    }
  ingress {
    description = "Jonesy Public IP"
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = ["70.112.129.185/32"]
    }
  ingress {
    description = "Michael Public IP"
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = ["73.24.99.69/32"]
    }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "sftp" {
  
  vpc_id = "${module.vpc.vpc_id}"
  name        = "security_group_sftp"
    description = "Allow SSH traffic to RDS"
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24","10.20.0.0/16"]
  }
}
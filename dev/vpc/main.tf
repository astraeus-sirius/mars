module "vpc" {
  source = "../../modules/vpc"

  name = "IAS_Dev"

  cidr = "10.30.0.0/16"

  azs                 = "${data.aws_availability_zones.available.names}"
  private_subnets     = "${var.private_subnets}"
  public_subnets      = "${var.public_subnets}"
  database_subnets    = "${var.database_subnets}"
 # elasticache_subnets = "${var.elasticache_subnets}"
 # redshift_subnets    = "${var.redshift_subnets}"
  intra_subnets       = "${var.intra_subnets}"

  create_database_subnet_group = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_vpn_gateway = true

  assign_generated_ipv6_cidr_block = true

  enable_dhcp_options              = false
  dhcp_options_domain_name         = "${var.dir_domain_name}"
  dhcp_options_domain_name_servers = ["${data.terraform_remote_state.ad.outputs.active_directory_ips}"]
  # VPC endpoint for S3
  enable_s3_endpoint = true

  # VPC endpoint for DynamoDB
  enable_dynamodb_endpoint = false

  # VPC endpoint for SSM
  enable_ssm_endpoint              = true
  ssm_endpoint_private_dns_enabled = true
  ssm_endpoint_security_group_ids  = ["${data.aws_security_group.default.id}"] # ssm_endpoint_subnet_ids = ["..."]

  # VPC endpoint for SSMMESSAGES
  enable_ssmmessages_endpoint              = true
  ssmmessages_endpoint_private_dns_enabled = true
  ssmmessages_endpoint_security_group_ids  = ["${data.aws_security_group.default.id}"]

  # VPC Endpoint for EC2
  enable_ec2_endpoint              = true
  ec2_endpoint_private_dns_enabled = true
  ec2_endpoint_security_group_ids  = ["${data.aws_security_group.default.id}"]

  # VPC Endpoint for EC2MESSAGES
  enable_ec2messages_endpoint              = true
  ec2messages_endpoint_private_dns_enabled = true
  ec2messages_endpoint_security_group_ids  = ["${data.aws_security_group.default.id}"]

  # VPC Endpoint for ECR API
  enable_ecr_api_endpoint              = true
  ecr_api_endpoint_private_dns_enabled = true
  ecr_api_endpoint_security_group_ids  = ["${data.aws_security_group.default.id}"]

  # VPC Endpoint for ECR DKR
  enable_ecr_dkr_endpoint              = true
  ecr_dkr_endpoint_private_dns_enabled = true
  ecr_dkr_endpoint_security_group_ids  = ["${data.aws_security_group.default.id}"]

  # VPC endpoint for KMS
  enable_kms_endpoint              = false
  kms_endpoint_private_dns_enabled = false
  kms_endpoint_security_group_ids  = ["${data.aws_security_group.default.id}"]

  # kms_endpoint_subnet_ids = ["..."]
  public_dedicated_network_acl = true
  public_inbound_acl_rules = concat(
    local.network_acls["default_inbound"],
    local.network_acls["public_inbound"],
  )
  public_outbound_acl_rules = concat(
    local.network_acls["default_outbound"],
    local.network_acls["public_outbound"],
  )

  private_dedicated_network_acl = true
  private_inbound_acl_rules = concat(
    local.network_acls["default_inbound"],
   local.network_acls["private_inbound"],
  )
  private_outbound_acl_rules = concat(
    local.network_acls["default_outbound"],
   local.network_acls["private_outbound"],
  )

  tags = {
    Owner       = "IAS"
    Environment = "Production"
    Name        = "IAS_Dev"
  }
}
module "db" {
  source  = "terraform-aws-modules/rds/aws"

  identifier = "awglbdb"

  engine            = "sqlserver-se"
  engine_version    = "14.00.3192.2.v1"
  instance_class    = "db.m5.xlarge"
  allocated_storage = 450
  storage_encrypted = false

  name     = null # "awglbdb"
  username = "admin"
  password = "ae+U[*dd>%ScSw%$+hBp_Z]ycJC%z2d?"
  port     = "1777"
  publicly_accessible = false

  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.awg_rds_security_group_id]

  maintenance_window = "Sun:00:00-Sun:03:00"
  backup_window      = "03:00-06:00"

  # disable backups to create DB faster
  backup_retention_period = 30

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  subnet_ids =[
			"${data.terraform_remote_state.vpc.outputs.private_subnets[0]}",
			"${data.terraform_remote_state.vpc.outputs.private_subnets[1]}"
		]

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "iasdb"

  create_db_parameter_group = false
  license_model             = "license-included"

  timezone = "Pacific Standard Time"

  # Database Deletion Protection
  deletion_protection = false

  # DB options
  major_engine_version = "14.00"

  options = []

  multi_az = false 

    // lifecycle {
    //   create_before_destroy = true
    // }
}
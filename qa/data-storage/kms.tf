#KMS key needed here for password encryption
// resource "aws_kms_secrets" "rds-key" {
//     description = "key to encrypt rds password"
//     tags = {
//         Name = "ias-rds-kms-key"
//   }
// }

// resource "aws_kms_alias" "rds-kms-alias" {
//   target_key_id = "${aws_kms_secrets.rds-key.id}"
//   name = "alias/rds-kms-key"
// }
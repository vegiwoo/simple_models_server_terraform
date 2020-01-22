terraform {
  backend "s3" {
    bucket = "sms-backend-save"
    key    = "network/terraform.tfstate"
    region = "eu-central-1"
    //dynamodb_table = "vgw-terra-bcknd-table"
  }
}

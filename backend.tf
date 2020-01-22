// DynamoDB Terraform State Lock Table
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}

// Backend specification
terraform {
  backend "s3" {
    bucket = "sms-backend-save"
    encrypt = true
    key    = "network/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}

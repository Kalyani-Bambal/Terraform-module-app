resource "aws_dynamodb_table" "basic_dynamodb_table" {
  name         = "${var.env}-infra-app-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "var.hash_key"   # ✅ Must match what Terraform expects

  attribute {
    name = "var.hash_key"         # ✅ Must match the hash_key exactly
    type = "S"
  }

  tags = {
    Name = "${var.env}-infra-app-table"
    Enivronment = var.env
  }
}
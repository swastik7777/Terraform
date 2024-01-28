resource "aws_dynamodb_table" "demo_table" {

	name = "${var.env_name}-${var.table_name}"
	billing_mode = "PAY_PER_REQUEST"
	hash_key = "email_id"

	attribute {

		name = "email_id"
		type = "S"
	}
}

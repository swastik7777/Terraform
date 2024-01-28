resource "aws_s3_bucket" "demo_s3" {
	
	bucket = "${var.env_name}-${var.bucket_name}"

}

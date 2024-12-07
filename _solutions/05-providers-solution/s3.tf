resource "random_id" "bucket_suffix" {
  byte_length = 8

}
resource "aws_s3_bucket" "bucket_in_eu_central" {
  bucket = "01-random-bucket-${random_id.bucket_suffix.hex}"
}

resource "aws_s3_bucket" "bucket_in_eu_west" {
  bucket   = "02-random-bucket-${random_id.bucket_suffix.hex}"
  provider = aws.aws_eu-west
}

output "bucket_in_eu_central_name" {
  value = aws_s3_bucket.bucket_in_eu_central.bucket
}

output "bucket_in_eu_west_name" {
  value = aws_s3_bucket.bucket_in_eu_west.bucket
}

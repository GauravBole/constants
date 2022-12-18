resource "aws_s3_bucket" "project_bucket" {
  bucket = local.bucket_name
  tags = {
    Name        = "Environmanet"
    Environment = var.environmanet
  }
}

resource "aws_s3_bucket_object" "packages" {
  bucket = aws_s3_bucket.project_bucket.id
  key    = "packages/"

}

resource "aws_s3_bucket_object" "scripts" {
  bucket = aws_s3_bucket.project_bucket.id
  key    = "scripts/"
}

resource "aws_s3_bucket_object" "temp_dir" {
  bucket = aws_s3_bucket.project_bucket.id
  key    = "temp_dir/"
}

resource "aws_s3_bucket_object" "source_path" {
  bucket = aws_s3_bucket.project_bucket.id
  key    = "source/"
}


resource "aws_s3_bucket_object" "destination_path" {
  bucket = aws_s3_bucket.project_bucket.id
  key    = "destination/"
}


resource "aws_s3_bucket_object" "object1" {
  for_each = fileset("scripts/", "*")
  bucket   = aws_s3_bucket.project_bucket.id
  key      = "scripts/${each.value}"
  source   = "scripts/${each.value}"
  etag     = filemd5("scripts/${each.value}")
}

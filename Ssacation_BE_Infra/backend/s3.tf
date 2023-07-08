resource "aws_s3_bucket" "tfstate" {

  bucket = "ssacation-terraform-backend"
}

resource "aws_s3_bucket_versioning" "tfstate_versioning" {
  bucket = aws_s3_bucket.tfstate.id

  versioning_configuration {
    status = "Enabled"
  }
}
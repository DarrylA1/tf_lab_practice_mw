#########################################
########### S3 Bucket Creation ##########
#########################################
resource "aws_s3_bucket" "mw_lab_bucket" {
    bucket = "mw-lab-bucket-78647126418589"

    lifecycle {
      prevent_destroy = true
    }

    tags = {
        Name = "mw-lab-bucket-8647126418589-tfstates"
        Environment = "Test"
    }
}

resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = aws_s3_bucket.mw_lab_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}


#########################################
########### Dynamo DB Table Creation ####
#########################################

resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock"
  }
}


terraform {
  backend "s3" {
    bucket = "mw-lab-bucket-78647126418589"
    key    = "mw-lab-bucket-8647126418589-tfstates"
    dynamodb_table = "terraform-lock"
  }
}
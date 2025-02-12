terraform {
  backend "s3" {
    bucket = "467.devops.candidate.exam"
    region = "ap-south-1"
    key     = "<Your First Name>.<Your Last Name>"
  }
}

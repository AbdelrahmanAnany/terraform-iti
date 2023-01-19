terraform {
  backend "s3" {
    bucket = "terraform-iti"
    key    = "terrafrom.tfstate"
    region = "us-east-1"
    dynamodb_table = "Abdelrahman-01"
  }
}

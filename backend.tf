terraform {
  backend "s3" {
    bucket = "terraformbucketsayeed"
    key = "terraform/backend"
    region = "us-east-1"
    
  }
}
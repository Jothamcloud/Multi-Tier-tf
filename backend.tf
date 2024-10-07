terraform {
  backend "s3" {
    bucket = "self-hosted-577932"
    key    = "three-tier-terrform.tfstate"
    region = "us-east-1"
  }
}

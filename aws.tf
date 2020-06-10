provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "sl-demo-test"
    key    = "meinprojekt.tfstate"
    region = "eu-central-1"
  }
}
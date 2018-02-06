terraform {
  backend "s3" {
    bucket = "beanstalk101-tfstates"
    key    = "beanstalk101/tf-state"
    region = "us-east-1"
  }
}

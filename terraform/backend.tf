terraform {
  backend "s3" {
    bucket = "${var.backend_bucket}"
    key    = "beanstalk101/tf-state"
    region = "us-east-1"
  }
}

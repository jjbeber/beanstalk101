provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_elastic_beanstalk_application" "beanstalk101" {
  name        = "beanstalk101"
  description = "Example Application"
}


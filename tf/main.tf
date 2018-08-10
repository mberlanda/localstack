provider "aws" {
  region                      = "us-east-1"
  access_key                  = "anaccesskey"
  secret_key                  = "asecretkey"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  # s3_force_path_style         = true

  endpoints {
    sqs      = "http://localhost:4576"
  }
}

resource "aws_sqs_queue" "terraform_queue_mq" {
  name                        = "terraform-queue-mq.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue" "terraform_queue" {
  name                        = "my-queue"
}
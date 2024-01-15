/* we create a s3 bucket to store our states remotely and available to others
 the aws_dynamodb_table will  This backend supports state locking and consistency
 checking with a Dynamo DB table. This will make it possible to avoid corrupting the 
 states following simultaneous deployments for example. */

resource "aws_s3_bucket" "malick_bucket" {
    bucket = "mytest-terraform-state-backend"
    object_lock_enabled = true
    tags = {
        Name = "S3 Remote Terraform State Store"
        Environment = "test"
    }

    }
/* Enable versioning on your S3 bucket, if you have not already done so.
 Doing so will generate an "Object Lock token" in the back-end. */
resource "aws_s3_bucket_versioning" "mytest_bucket_versioning" {
  bucket = aws_s3_bucket.malick_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "mytest_bucket_enc" {
        bucket = aws_s3_bucket.malick_bucket.id
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
# Provides an S3 bucket Object Lock configuration resource.
# This resource configures a default retention period for objects placed in the specified bucket.
resource "aws_s3_bucket_object_lock_configuration" "mytest_bucket_lock" {
     bucket = aws_s3_bucket.malick_bucket.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 5
    }
  }
}

resource "aws_dynamodb_table" "terraform-lock" {
    name           = "terraform_state"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "DynamoDB Terraform State Lock Table"
    }
}

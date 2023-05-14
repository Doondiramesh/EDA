provider "aws" {
  region = "ap-south-1"
}

terraform {
  # Terraform Version
  required_version = "~> 1.2.3"

}

# ###### Terraform State file configuration. S3 : for State file storate ;; DynamoDB Table : to Lock the state file
# terraform {
#   backend "s3" {
#     # Replace this with your bucket name!
#     bucket         = "terraform-up-and-running-state-eda"
#     key            = "global/s3/terraform.tfstate"
#     region         = "ap-south-1"

#     # Replace this with your DynamoDB table name!
#     dynamodb_table = "terraform-up-and-running-locks-eda"
#     encrypt        = true
#   }
# }

module "src_s3_bucket" {
  source = "../../../modules/terraform-aws-s3-bucket-master"

  bucket = "${var.bucket_name_prefix}-demo-src-bucket"
  tags   = var.common_tags
}

module "dest_s3_bucket" {
  source = "../../../modules/terraform-aws-s3-bucket-master"

  bucket = "${var.bucket_name_prefix}-demo-dest-bucket"
  tags = merge(
    var.common_tags,
    {
      Resource = "s3"
    }
  )
}

resource "aws_s3_object" "src_bkt_objects" {
  bucket = module.src_s3_bucket.s3_bucket_id
  count  = length(var.src_s3_folders)
  key    = "${var.src_s3_folders[count.index]}/"

  #source                 = "index.html"
  # server_side_encryption = "aws:kms"
}

resource "aws_s3_object" "dest_bkt_objects" {
  bucket = module.dest_s3_bucket.s3_bucket_id
  count  = length(var.dest_s3_folders)
  key    = "${var.dest_s3_folders[count.index]}/"
}
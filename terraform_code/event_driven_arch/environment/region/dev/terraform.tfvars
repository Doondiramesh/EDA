bucket_name_prefix = "ram" ##${var.bucket_name_prefix}-demo-src-bucket
src_s3_folders     = ["fci/inbound/ProjectFolder-1", "fci/inbound/ProjectFolder-2", "fci/inbound/ProjectFolder-3", "fci/inbound/ProjectFolder-4"]
dest_s3_folders    = ["fci/outbound"]
### Update terraform.tfvars Branch_20230514_V4
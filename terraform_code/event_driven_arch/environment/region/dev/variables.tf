variable "common_tags" {
  type = map(string)
  default = {
    Ticket  = "ticket-number"
    Creator = "Demo Team"
    Owner   = "Demo Team"
    Tier    = "Demo"
  }
}


variable "bucket_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket."
  type        = string
  default     = null
}

variable "src_s3_folders" {
  type        = list(any)
  description = "The list of s3 folders to create"
  #default = ["fci/inbound/ProjectFolder-1","fci/inbound/ProjectFolder-2","fci/inbound/ProjectFolder-3"]
  default = null
}

variable "dest_s3_folders" {
  type        = list(any)
  description = "The list of s3 folders to create"
  default     = null
}
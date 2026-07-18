variable "bucket" {
  description = "Name of the S3 bucket. Must be globally unique."
  type        = string
}

variable "force_destroy" {
  description = "Whether to allow deletion of a non-empty bucket by removing all objects first."
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Whether to enable object versioning on the bucket."
  type        = bool
  default     = true
}

variable "block_public_access" {
  description = "Whether to enable all four S3 public access block settings on the bucket."
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm. Either AES256 or aws:kms."
  type        = string
  default     = "AES256"

  validation {
    condition     = contains(["AES256", "aws:kms"], var.sse_algorithm)
    error_message = "sse_algorithm must be either AES256 or aws:kms."
  }
}

variable "kms_key_id" {
  description = "ARN of the KMS key used when sse_algorithm is aws:kms. Null uses the default S3 KMS key."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to the bucket."
  type        = map(string)
  default     = {}
}

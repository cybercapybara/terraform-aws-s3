# terraform-aws-s3

Terraform module that manages an [Amazon S3](https://aws.amazon.com/s3/) bucket.
It creates a single bucket and wires up versioning, default server-side
encryption and public access blocking so the bucket is private and durable by
default.

## Usage

```hcl
module "s3" {
  source = "github.com/moveeeax/terraform-aws-s3"

  bucket             = "prod-app-assets"
  versioning_enabled = true

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| aws       | >= 5.0   |

## Inputs

| Name                  | Description                                                             | Type          | Default    | Required |
|-----------------------|-------------------------------------------------------------------------|---------------|------------|:--------:|
| `bucket`              | Name of the S3 bucket. Must be globally unique.                         | `string`      | n/a        |   yes    |
| `force_destroy`       | Allow deletion of a non-empty bucket by removing all objects first.     | `bool`        | `false`    |    no    |
| `versioning_enabled`  | Enable object versioning on the bucket.                                 | `bool`        | `true`     |    no    |
| `block_public_access` | Enable all four S3 public access block settings on the bucket.          | `bool`        | `true`     |    no    |
| `sse_algorithm`       | Server-side encryption algorithm. Either AES256 or aws:kms.             | `string`      | `"AES256"` |    no    |
| `kms_key_id`          | ARN of the KMS key used when sse_algorithm is aws:kms.                  | `string`      | `null`     |    no    |
| `tags`                | Tags applied to the bucket.                                            | `map(string)` | `{}`       |    no    |

## Outputs

| Name                          | Description                                        |
|-------------------------------|----------------------------------------------------|
| `id`                          | Name of the bucket.                                |
| `arn`                         | ARN of the bucket.                                 |
| `bucket_domain_name`          | Domain name of the bucket.                         |
| `bucket_regional_domain_name` | Region-specific domain name of the bucket.         |
| `hosted_zone_id`              | Route 53 hosted zone ID for the bucket's region.   |

## License

[MIT](LICENSE)

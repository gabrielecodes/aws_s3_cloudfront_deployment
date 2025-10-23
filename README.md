# S3 + Cloudfront Terraform Configuration

## Prerequisites

An AWS account with permissions to create the following resources:
- S3 buckets
- CloudFront distributions
- Route 53 DNS records

# Setup

## Domain name

Define the variable domain_name with your website's domain name.
For example, if you own example.com, set:

```
domain_name = "example.com"
```
This Terraform configuration will:
- Create A records for both `example.com` (root domain) and `www.example.com` (subdomain).
- Set up a redirect from `example.com` to `www.example.com`.

## Other variables

Make sure to define the following variables:

| Variable      | Description                                                              |
| ------------- | ------------------------------------------------------------------------ |
| `region`      | The AWS region where you want to provision resources (e.g., `us-east-1`) |
| `domain_name` | Your website's domain name (e.g., `example.com`)                         |
| `bucket_name` | Name of the S3 bucket where your website files will be stored            |
| `main_page`   | The entry point file of your website (e.g., `index.html`)                |
| `error_page`  | The error page file of your website (e.g., `404.html`)                   |


## Deployment

Initialize the config with

```
terraform init
```

Check if the configuration is applicable with

```
terraform plan
```

Finally provision the resources with

```
terraform apply
```

## Notes

- Ensure your domain's DNS is managed in Route 53 or you have appropriate access to update DNS records.
- The configuration creates necessary DNS records and provisions CloudFront with SSL certificates via ACM.

## Examples of Variable Definitions

After cloning this repository, navigate to the project directory and can create a `terraform.tfvars` file.
The variables in this file will be automatically used by terraform. Here's an example of what the file may contain:

```
region       = "us-east-1"
domain_name  = "example.com"
bucket_name  = "example-com-static-site"
main_page    = "index.html"
error_page   = "404.html"
```

With the `aws cli` you can upload the website files in the directory `<my_local_website_dir>` (e.g. "example-com-static-site")
to the bucket  named `<website_s3_bucket_name>` with the following command:

```
aws s3 sync ./<my_local_website_dir> s3://<website_s3_bucket_name> --delete
```

Note: check that your website entrypoint is in a file called specified in the variable `main_page` (e.g. main_page = "index.html")

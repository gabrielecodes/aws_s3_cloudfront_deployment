variable "region" {
  description = "AWS Region"
  type        = string
}

variable "domain_name" {
  description = "Custom domain address (without 'http(s)://www')"
  type        = string
}

variable "bucket_name" {
  description = "Name of the bucket hosting the website"
  type        = string
}

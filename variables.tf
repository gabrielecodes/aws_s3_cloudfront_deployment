variable "region" {
  description = "AWS Region"
  type        = string
}

variable "domain_name" {
  description = "Fully Qualified Domain name (without 'http(s)://www')"
  type        = string
}

variable "bucket_name" {
  description = "Name of the bucket hosting the website"
  type        = string
}

variable "main_page" {
  description = "File name of the website entrypoint (e.g. index.hml)"
  type        = string
}

variable "error_page" {
  description = "File name of the error page (e.g. error.hml)"
  type        = string
}

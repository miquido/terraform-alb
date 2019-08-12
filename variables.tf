variable "environment" {
  default     = ""
  description = "Environment name"
}

variable "name" {
  type        = "string"
  description = "Resource common name"
}

variable "project" {
  type        = "string"
  description = "Account/Project Name"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Tags to apply on repository"
}

variable "domain" {
  default     = ""
  description = "Domain to request ACM certificate for root domain and wildcard SAN"
}

variable "region" {
  type        = "string"
  description = "AWS Region"
}

variable "vpc_id" {
  type        = "string"
  description = "The VPC ID where resources are created"
}

variable "subnet_ids" {
  description = "Private subnet IDs"
  type        = "list"
}

variable "security_group_ids" {
  type        = "list"
  default     = []
  description = "A list of additional security group IDs to allow access to ALB"
}

variable "enable_redirect_http_to_https" {
  type        = "string"
  default     = "false"
  description = "Attach rule to HTTP listener that redirects "
}

variable "redirect_http_to_https_priority" {
  default     = 5
  description = "HTTP Listener Rule priority"
}

variable "redirect_http_to_https_status_code" {
  default     = "HTTP_301"
  description = "The HTTP redirect code. The redirect is either permanent (HTTP_301) or temporary (HTTP_302)"
}

variable "zone_name" {
  default     = ""
  description = "The name of the desired Route53 Hosted Zone for ACM Certificate (by default var.domain_name is used)"
}

variable "acm_certificate_request_enabled" {
  default     = "true"
  description = "Whether to generate ACM certificate automatically"
}


variable "wait_for_certificate_issued" {
  default     = "false"
  description = "Whether to wait for the certificate to be issued by ACM (the certificate status changed from Pending Validation to Issued)"
}

variable "acm_certificate_arn" {
  default     = ""
  description = "Provide ARN of custom ACM Certifcate. Used only if var.acm_certificate_request_enabled is false"
}

variable "process_domain_validation_options" {
  default     = "true"
  description = "Flag to enable/disable processing of the record to add to the DNS zone to complete certificate validation"
}

variable "validation_method" {
  default     = "DNS"
  description = "Method to use for validation, DNS or EMAIL"
}

variable "domain_ttl" {
  default     = "300"
  description = "The TTL of the record to add to the DNS zone to complete certificate validation"
}

variable "subject_alternative_names" {
  default     = []
  description = "A list of domains that should be SANs in the issued certificate. By default wildcard is used: *.var.domain_name"
}

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

variable "http_port" {
  type        = "string"
  default     = "80"
  description = "The port for the HTTP listener"
}

variable "http_enabled" {
  type        = "string"
  default     = "true"
  description = "A boolean flag to enable/disable HTTP listener"
}

variable "http_ingress_cidr_blocks" {
  type        = "list"
  default     = ["0.0.0.0/0"]
  description = "List of CIDR blocks to allow in HTTP security group"
}

variable "http_ingress_prefix_list_ids" {
  type        = "list"
  default     = []
  description = "List of prefix list IDs for allowing access to HTTP ingress security group"
}

variable "https_port" {
  type        = "string"
  default     = "443"
  description = "The port for the HTTPS listener"
}

variable "https_enabled" {
  type        = "string"
  default     = "true"
  description = "A boolean flag to enable/disable HTTPS listener"
}

variable "https_ingress_cidr_blocks" {
  type        = "list"
  default     = ["0.0.0.0/0"]
  description = "List of CIDR blocks to allow in HTTPS security group"
}

variable "https_ingress_prefix_list_ids" {
  type        = "list"
  default     = []
  description = "List of prefix list IDs for allowing access to HTTPS ingress security group"
}

variable "https_ssl_policy" {
  description = "The name of the SSL Policy for the listener."
  default     = "ELBSecurityPolicy-2015-05"
}

variable "cross_zone_load_balancing_enabled" {
  type        = "string"
  default     = "false"
  description = "A boolean flag to enable/disable cross zone load balancing"
}

variable "idle_timeout" {
  type        = "string"
  default     = "60"
  description = "The time in seconds that the connection is allowed to be idle"
}

variable "ip_address_type" {
  type        = "string"
  default     = "ipv4"
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4` and `dualstack`."
}

variable "internal" {
  type        = "string"
  default     = "false"
  description = "A boolean flag to determine whether the ALB should be internal"
}

variable "deletion_protection_enabled" {
  type        = "string"
  default     = "false"
  description = "A boolean flag to enable/disable deletion protection for ALB"
}

variable "http2_enabled" {
  type        = "string"
  default     = "true"
  description = "A boolean flag to enable/disable HTTP/2"
}

variable "deregistration_delay" {
  type        = "string"
  default     = "15"
  description = "The amount of time to wait in seconds before changing the state of a deregistering target to unused"
}

variable "health_check_path" {
  type        = "string"
  default     = "/"
  description = "The destination for the health check request"
}

variable "health_check_timeout" {
  type        = "string"
  default     = "10"
  description = "The amount of time to wait in seconds before failing a health check request"
}

variable "health_check_healthy_threshold" {
  type        = "string"
  default     = "2"
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
}

variable "health_check_unhealthy_threshold" {
  type        = "string"
  default     = "2"
  description = "The number of consecutive health check failures required before considering the target unhealthy"
}

variable "health_check_interval" {
  type        = "string"
  default     = "15"
  description = "The duration in seconds in between health checks"
}

variable "health_check_matcher" {
  type        = "string"
  default     = "200-399"
  description = "The HTTP response codes to indicate a healthy check"
}

variable "access_logs_prefix" {
  type        = "string"
  default     = ""
  description = "The S3 bucket prefix"
}

variable "access_logs_enabled" {
  type        = "string"
  default     = "true"
  description = "A boolean flag to enable/disable access_logs"
}

# TODO: Rename to "access_logs_region"
variable "region" {
  type        = "string"
  default     = "eu-central-1"
  description = "The region for the access_logs S3 bucket"
}

variable "access_logs_s3_bucket_force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the ALB access logs S3 bucket so that the bucket can be destroyed without error"
  default     = false
}

variable "target_group_port" {
  description = "The port for the default target group"
  default     = "80"
}

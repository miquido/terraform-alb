variable "environment" {
  type        = string
  default     = ""
  description = "Environment name"
}

variable "name" {
  type        = string
  description = "Resource common name"
}

variable "project" {
  type        = string
  description = "Account/Project Name"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply on repository"
}

variable "domain" {
  type        = string
  default     = ""
  description = "Domain to request ACM certificate for root domain and wildcard SAN"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID where resources are created"
}

variable "subnet_ids" {
  description = "A list of (typically public) subnet IDs to associate with ALB."
  type        = list(string)
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
  description = "A list of additional security group IDs to allow access to ALB"
}

variable "enable_redirect_http_to_https" {
  type        = bool
  default     = false
  description = "Attach rule to HTTP listener that redirects "
}

variable "redirect_http_to_https_priority" {
  type        = number
  default     = 5
  description = "HTTP Listener Rule priority"
}

variable "redirect_http_to_https_status_code" {
  type        = string
  default     = "HTTP_301"
  description = "The HTTP redirect code. The redirect is either permanent (HTTP_301) or temporary (HTTP_302)"
}

variable "internal" {
  type        = bool
  default     = false
  description = "A boolean flag to determine whether the ALB should be internal"
}

variable "http_port" {
  type        = number
  default     = 80
  description = "The port for the HTTP listener"
}

variable "http_enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable HTTP listener"
}

variable "http_ingress_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "List of CIDR blocks to allow in HTTP security group"
}

variable "http_ingress_prefix_list_ids" {
  type        = list(string)
  default     = []
  description = "List of prefix list IDs for allowing access to HTTP ingress security group"
}

variable "acm_certificate_arn" {
  type        = string
  default     = ""
  description = "The ARN of the default SSL certificate for HTTPS listener. Required if `https_enabled` is true."
}

variable "https_port" {
  type        = number
  default     = 443
  description = "The port for the HTTPS listener"
}

variable "https_enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable HTTPS listener"
}

variable "https_ingress_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "List of CIDR blocks to allow in HTTPS security group"
}

variable "https_ingress_prefix_list_ids" {
  type        = list(string)
  default     = []
  description = "List of prefix list IDs for allowing access to HTTPS ingress security group"
}

variable "https_ssl_policy" {
  type        = string
  description = "The name of the SSL Policy for the listener"
  default     = "ELBSecurityPolicy-2016-08"
}

variable "access_logs_prefix" {
  type        = string
  default     = ""
  description = "The S3 log bucket prefix"
}

variable "access_logs_enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable access_logs"
}

variable "cross_zone_load_balancing_enabled" {
  type        = bool
  default     = false
  description = "A boolean flag to enable/disable cross zone load balancing"
}

variable "http2_enabled" {
  type        = bool
  default     = true
  description = "A boolean flag to enable/disable HTTP/2"
}

variable "idle_timeout" {
  type        = number
  default     = 60
  description = "The time in seconds that the connection is allowed to be idle"
}

variable "ip_address_type" {
  type        = string
  default     = "ipv4"
  description = "The type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4` and `dualstack`."
}

variable "deletion_protection_enabled" {
  type        = bool
  default     = false
  description = "A boolean flag to enable/disable deletion protection for ALB"
}

variable "deregistration_delay" {
  type        = number
  default     = 15
  description = "The amount of time to wait in seconds before changing the state of a deregistering target to unused"
}

variable "health_check_path" {
  type        = string
  default     = "/"
  description = "The destination for the health check request"
}

variable "health_check_timeout" {
  type        = number
  default     = 10
  description = "The amount of time to wait in seconds before failing a health check request"
}

variable "health_check_healthy_threshold" {
  type        = number
  default     = 2
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy"
}

variable "health_check_unhealthy_threshold" {
  type        = number
  default     = 2
  description = "The number of consecutive health check failures required before considering the target unhealthy"
}

variable "health_check_interval" {
  type        = number
  default     = 15
  description = "The duration in seconds in between health checks"
}

variable "health_check_matcher" {
  type        = string
  default     = "200-399"
  description = "The HTTP response codes to indicate a healthy check"
}

variable "access_logs_s3_bucket_force_destroy" {
  type        = bool
  default     = false
  description = "A boolean that indicates all objects should be deleted from the ALB access logs S3 bucket so that the bucket can be destroyed without error"
}

variable "target_group_port" {
  type        = number
  default     = 80
  description = "The port for the default target group"
}

variable "target_group_name" {
  type        = string
  default     = ""
  description = "The name for the default target group, uses a module label name if left empty"
}

variable "target_group_target_type" {
  type        = string
  default     = "ip"
  description = "The type (`instance`, `ip` or `lambda`) of targets that can be registered with the target group"
}

variable "target_group_additional_tags" {
  type        = map(string)
  default     = {}
  description = "The additional tags to apply to the target group"
}

variable "http_ingress_ipv6_cidr_blocks" {
  type        = list(string)
  default     = ["::/0"]
  description = "List of IPv6 CIDR blocks to allow in HTTP security group"
}

variable "https_ingress_ipv6_cidr_blocks" {
  type        = list(string)
  default     = ["::/0"]
  description = "List of IPv6 CIDR blocks to allow in HTTPS security group"
}

variable "additional_certs" {
  type        = list(string)
  description = "A list of additonal certs to add to the https listerner"
  default     = []
}

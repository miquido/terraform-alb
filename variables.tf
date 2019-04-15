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

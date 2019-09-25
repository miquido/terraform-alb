## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| access_logs_enabled | A boolean flag to enable/disable access_logs | string | `true` | no |
| access_logs_prefix | The S3 bucket prefix | string | `` | no |
| access_logs_s3_bucket_force_destroy | A boolean that indicates all objects should be deleted from the ALB access logs S3 bucket so that the bucket can be destroyed without error | string | `false` | no |
| acm_certificate_arn | Provide ARN of custom ACM Certifcate. Used only if var.acm_certificate_request_enabled is false | string | `` | no |
| acm_certificate_request_enabled | Whether to generate ACM certificate automatically | string | `true` | no |
| cross_zone_load_balancing_enabled | A boolean flag to enable/disable cross zone load balancing | string | `false` | no |
| deletion_protection_enabled | A boolean flag to enable/disable deletion protection for ALB | string | `false` | no |
| deregistration_delay | The amount of time to wait in seconds before changing the state of a deregistering target to unused | string | `15` | no |
| domain | Domain to request ACM certificate for root domain and wildcard SAN | string | `` | no |
| domain_ttl | The TTL of the record to add to the DNS zone to complete certificate validation | string | `300` | no |
| enable_redirect_http_to_https | Attach rule to HTTP listener that redirects | string | `false` | no |
| environment | Environment name | string | `` | no |
| health_check_healthy_threshold | The number of consecutive health checks successes required before considering an unhealthy target healthy | string | `2` | no |
| health_check_interval | The duration in seconds in between health checks | string | `15` | no |
| health_check_matcher | The HTTP response codes to indicate a healthy check | string | `200-399` | no |
| health_check_path | The destination for the health check request | string | `/` | no |
| health_check_timeout | The amount of time to wait in seconds before failing a health check request | string | `10` | no |
| health_check_unhealthy_threshold | The number of consecutive health check failures required before considering the target unhealthy | string | `2` | no |
| http2_enabled | A boolean flag to enable/disable HTTP/2 | string | `true` | no |
| http_enabled | A boolean flag to enable/disable HTTP listener | string | `true` | no |
| http_ingress_cidr_blocks | List of CIDR blocks to allow in HTTP security group | list | `<list>` | no |
| http_ingress_prefix_list_ids | List of prefix list IDs for allowing access to HTTP ingress security group | list | `<list>` | no |
| http_port | The port for the HTTP listener | string | `80` | no |
| https_enabled | A boolean flag to enable/disable HTTPS listener | string | `true` | no |
| https_ingress_cidr_blocks | List of CIDR blocks to allow in HTTPS security group | list | `<list>` | no |
| https_ingress_prefix_list_ids | List of prefix list IDs for allowing access to HTTPS ingress security group | list | `<list>` | no |
| https_port | The port for the HTTPS listener | string | `443` | no |
| https_ssl_policy | The name of the SSL Policy for the listener. | string | `ELBSecurityPolicy-2015-05` | no |
| idle_timeout | The time in seconds that the connection is allowed to be idle | string | `60` | no |
| internal | A boolean flag to determine whether the ALB should be internal | string | `false` | no |
| ip_address_type | The type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4` and `dualstack`. | string | `ipv4` | no |
| name | Resource common name | string | - | yes |
| process_domain_validation_options | Flag to enable/disable processing of the record to add to the DNS zone to complete certificate validation | string | `true` | no |
| project | Account/Project Name | string | - | yes |
| redirect_http_to_https_priority | HTTP Listener Rule priority | string | `5` | no |
| redirect_http_to_https_status_code | The HTTP redirect code. The redirect is either permanent (HTTP_301) or temporary (HTTP_302) | string | `HTTP_301` | no |
| region | The region for the access_logs S3 bucket | string | `eu-central-1` | no |
| security_group_ids | A list of additional security group IDs to allow access to ALB | list | `<list>` | no |
| subject_alternative_names | A list of domains that should be SANs in the issued certificate. By default wildcard is used: *.var.domain_name | list | `<list>` | no |
| subnet_ids | Private subnet IDs | list | - | yes |
| tags | Tags to apply on repository | map | `<map>` | no |
| target_group_port | The port for the default target group | string | `80` | no |
| validation_method | Method to use for validation, DNS or EMAIL | string | `DNS` | no |
| vpc_id | The VPC ID where resources are created | string | - | yes |
| wait_for_certificate_issued | Whether to wait for the certificate to be issued by ACM (the certificate status changed from Pending Validation to Issued) | string | `false` | no |
| zone_name | The name of the desired Route53 Hosted Zone for ACM Certificate (by default var.domain_name is used) | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| access_logs_bucket_id | The S3 bucket ID for access logs |
| acm_request_arn | The ARN of the ACM Request |
| acm_request_domain_validation_options | CNAME records that are added to the DNS zone to complete certificate validation |
| acm_request_id | The ID of the ACM Request |
| alb_arn | The ARN of the ALB |
| alb_arn_suffix | The ARN suffix of the ALB |
| alb_dns_name | DNS name of ALB |
| alb_name | The ARN suffix of the ALB |
| alb_zone_id | The ID of the zone which ALB is provisioned |
| default_target_group_arn | The default target group ARN |
| http_listener_arn | The ARN of the HTTP listener |
| https_listener_arn | The ARN of the HTTPS listener |
| listener_arns | A list of all the listener ARNs |
| security_group_id | The security group ID of the ALB |


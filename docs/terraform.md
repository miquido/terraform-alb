## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| access_logs_enabled | A boolean flag to enable/disable access_logs | bool | `true` | no |
| access_logs_prefix | The S3 log bucket prefix | string | `` | no |
| access_logs_region | The region for the access_logs S3 bucket | string | `us-east-1` | no |
| access_logs_s3_bucket_force_destroy | A boolean that indicates all objects should be deleted from the ALB access logs S3 bucket so that the bucket can be destroyed without error | bool | `false` | no |
| acm_certificate_arn | The ARN of the default SSL certificate for HTTPS listener. Required if `https_enabled` is true. | string | `` | no |
| cross_zone_load_balancing_enabled | A boolean flag to enable/disable cross zone load balancing | bool | `false` | no |
| deletion_protection_enabled | A boolean flag to enable/disable deletion protection for ALB | bool | `false` | no |
| deregistration_delay | The amount of time to wait in seconds before changing the state of a deregistering target to unused | number | `15` | no |
| domain | Domain to request ACM certificate for root domain and wildcard SAN | string | `` | no |
| enable_redirect_http_to_https | Attach rule to HTTP listener that redirects | bool | `false` | no |
| environment | Environment name | string | `` | no |
| health_check_healthy_threshold | The number of consecutive health checks successes required before considering an unhealthy target healthy | number | `2` | no |
| health_check_interval | The duration in seconds in between health checks | number | `15` | no |
| health_check_matcher | The HTTP response codes to indicate a healthy check | string | `200-399` | no |
| health_check_path | The destination for the health check request | string | `/` | no |
| health_check_timeout | The amount of time to wait in seconds before failing a health check request | number | `10` | no |
| health_check_unhealthy_threshold | The number of consecutive health check failures required before considering the target unhealthy | number | `2` | no |
| http2_enabled | A boolean flag to enable/disable HTTP/2 | bool | `true` | no |
| http_enabled | A boolean flag to enable/disable HTTP listener | bool | `true` | no |
| http_ingress_cidr_blocks | List of CIDR blocks to allow in HTTP security group | list(string) | `<list>` | no |
| http_ingress_ipv6_cidr_blocks | List of IPv6 CIDR blocks to allow in HTTP security group | list(string) | `<list>` | no |
| http_ingress_prefix_list_ids | List of prefix list IDs for allowing access to HTTP ingress security group | list(string) | `<list>` | no |
| http_port | The port for the HTTP listener | number | `80` | no |
| https_enabled | A boolean flag to enable/disable HTTPS listener | bool | `true` | no |
| https_ingress_cidr_blocks | List of CIDR blocks to allow in HTTPS security group | list(string) | `<list>` | no |
| https_ingress_ipv6_cidr_blocks | List of IPv6 CIDR blocks to allow in HTTPS security group | list(string) | `<list>` | no |
| https_ingress_prefix_list_ids | List of prefix list IDs for allowing access to HTTPS ingress security group | list(string) | `<list>` | no |
| https_port | The port for the HTTPS listener | number | `443` | no |
| https_ssl_policy | The name of the SSL Policy for the listener | string | `ELBSecurityPolicy-2016-08` | no |
| idle_timeout | The time in seconds that the connection is allowed to be idle | number | `60` | no |
| internal | A boolean flag to determine whether the ALB should be internal | bool | `false` | no |
| ip_address_type | The type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4` and `dualstack`. | string | `ipv4` | no |
| name | Resource common name | string | - | yes |
| project | Account/Project Name | string | - | yes |
| redirect_http_to_https_priority | HTTP Listener Rule priority | string | `5` | no |
| redirect_http_to_https_status_code | The HTTP redirect code. The redirect is either permanent (HTTP_301) or temporary (HTTP_302) | string | `HTTP_301` | no |
| security_group_ids | A list of additional security group IDs to allow access to ALB | list(string) | `<list>` | no |
| subnet_ids | A list of (typically public) subnet IDs to associate with ALB. | list(string) | - | yes |
| tags | Tags to apply on repository | map(string) | `<map>` | no |
| target_group_additional_tags | The additional tags to apply to the target group | map(string) | `<map>` | no |
| target_group_name | The name for the default target group, uses a module label name if left empty | string | `` | no |
| target_group_port | The port for the default target group | number | `80` | no |
| target_group_target_type | The type (`instance`, `ip` or `lambda`) of targets that can be registered with the target group | string | `ip` | no |
| vpc_id | The VPC ID where resources are created | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| access_logs_bucket_id | The S3 bucket ID for access logs |
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


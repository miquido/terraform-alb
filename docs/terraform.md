## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| domain | Domain to request ACM certificate for root domain and wildcard SAN | string | `` | no |
| enable_redirect_http_to_https | Attach rule to HTTP listener that redirects | string | `false` | no |
| environment | Environment name | string | `` | no |
| name | Resource common name | string | - | yes |
| project | Account/Project Name | string | - | yes |
| redirect_http_to_https_priority | HTTP Listener Rule priority | string | `5` | no |
| redirect_http_to_https_status_code | The HTTP redirect code. The redirect is either permanent (HTTP_301) or temporary (HTTP_302) | string | `HTTP_301` | no |
| region | AWS Region | string | - | yes |
| security_group_ids | A list of additional security group IDs to allow access to ALB | list | `<list>` | no |
| subnet_ids | Private subnet IDs | list | - | yes |
| tags | Tags to apply on repository | map | `<map>` | no |
| vpc_id | The VPC ID where resources are created | string | - | yes |

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


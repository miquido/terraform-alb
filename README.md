<!-- This file was automatically generated by the `build-harness`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->
[![Miquido][logo]](https://www.miquido.com/)

# miquido-terraform-alb
This module Application Load Balancer along with AWS ACM TLS/SSL certificate via ACM Request
---
**Terraform Module**
<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 2.0 |
| local | >= 1.3 |
| null | >= 2.0 |
| template | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_logs\_enabled | A boolean flag to enable/disable access\_logs | `bool` | `true` | no |
| access\_logs\_prefix | The S3 log bucket prefix | `string` | `""` | no |
| access\_logs\_region | The region for the access\_logs S3 bucket | `string` | `"us-east-1"` | no |
| access\_logs\_s3\_bucket\_force\_destroy | A boolean that indicates all objects should be deleted from the ALB access logs S3 bucket so that the bucket can be destroyed without error | `bool` | `false` | no |
| acm\_certificate\_arn | The ARN of the default SSL certificate for HTTPS listener. Required if `https_enabled` is true. | `string` | `""` | no |
| cross\_zone\_load\_balancing\_enabled | A boolean flag to enable/disable cross zone load balancing | `bool` | `false` | no |
| deletion\_protection\_enabled | A boolean flag to enable/disable deletion protection for ALB | `bool` | `false` | no |
| deregistration\_delay | The amount of time to wait in seconds before changing the state of a deregistering target to unused | `number` | `15` | no |
| domain | Domain to request ACM certificate for root domain and wildcard SAN | `string` | `""` | no |
| enable\_redirect\_http\_to\_https | Attach rule to HTTP listener that redirects | `bool` | `false` | no |
| environment | Environment name | `string` | `""` | no |
| health\_check\_healthy\_threshold | The number of consecutive health checks successes required before considering an unhealthy target healthy | `number` | `2` | no |
| health\_check\_interval | The duration in seconds in between health checks | `number` | `15` | no |
| health\_check\_matcher | The HTTP response codes to indicate a healthy check | `string` | `"200-399"` | no |
| health\_check\_path | The destination for the health check request | `string` | `"/"` | no |
| health\_check\_timeout | The amount of time to wait in seconds before failing a health check request | `number` | `10` | no |
| health\_check\_unhealthy\_threshold | The number of consecutive health check failures required before considering the target unhealthy | `number` | `2` | no |
| http2\_enabled | A boolean flag to enable/disable HTTP/2 | `bool` | `true` | no |
| http\_enabled | A boolean flag to enable/disable HTTP listener | `bool` | `true` | no |
| http\_ingress\_cidr\_blocks | List of CIDR blocks to allow in HTTP security group | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| http\_ingress\_ipv6\_cidr\_blocks | List of IPv6 CIDR blocks to allow in HTTP security group | `list(string)` | <pre>[<br>  "::/0"<br>]</pre> | no |
| http\_ingress\_prefix\_list\_ids | List of prefix list IDs for allowing access to HTTP ingress security group | `list(string)` | `[]` | no |
| http\_port | The port for the HTTP listener | `number` | `80` | no |
| https\_enabled | A boolean flag to enable/disable HTTPS listener | `bool` | `true` | no |
| https\_ingress\_cidr\_blocks | List of CIDR blocks to allow in HTTPS security group | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| https\_ingress\_ipv6\_cidr\_blocks | List of IPv6 CIDR blocks to allow in HTTPS security group | `list(string)` | <pre>[<br>  "::/0"<br>]</pre> | no |
| https\_ingress\_prefix\_list\_ids | List of prefix list IDs for allowing access to HTTPS ingress security group | `list(string)` | `[]` | no |
| https\_port | The port for the HTTPS listener | `number` | `443` | no |
| https\_ssl\_policy | The name of the SSL Policy for the listener | `string` | `"ELBSecurityPolicy-2016-08"` | no |
| idle\_timeout | The time in seconds that the connection is allowed to be idle | `number` | `60` | no |
| internal | A boolean flag to determine whether the ALB should be internal | `bool` | `false` | no |
| ip\_address\_type | The type of IP addresses used by the subnets for your load balancer. The possible values are `ipv4` and `dualstack`. | `string` | `"ipv4"` | no |
| name | Resource common name | `string` | n/a | yes |
| project | Account/Project Name | `string` | n/a | yes |
| redirect\_http\_to\_https\_priority | HTTP Listener Rule priority | `number` | `5` | no |
| redirect\_http\_to\_https\_status\_code | The HTTP redirect code. The redirect is either permanent (HTTP\_301) or temporary (HTTP\_302) | `string` | `"HTTP_301"` | no |
| security\_group\_ids | A list of additional security group IDs to allow access to ALB | `list(string)` | `[]` | no |
| subnet\_ids | A list of (typically public) subnet IDs to associate with ALB. | `list(string)` | n/a | yes |
| tags | Tags to apply on repository | `map(string)` | `{}` | no |
| target\_group\_additional\_tags | The additional tags to apply to the target group | `map(string)` | `{}` | no |
| target\_group\_name | The name for the default target group, uses a module label name if left empty | `string` | `""` | no |
| target\_group\_port | The port for the default target group | `number` | `80` | no |
| target\_group\_target\_type | The type (`instance`, `ip` or `lambda`) of targets that can be registered with the target group | `string` | `"ip"` | no |
| vpc\_id | The VPC ID where resources are created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| access\_logs\_bucket\_id | The S3 bucket ID for access logs |
| alb\_arn | The ARN of the ALB |
| alb\_arn\_suffix | The ARN suffix of the ALB |
| alb\_dns\_name | DNS name of ALB |
| alb\_name | The ARN suffix of the ALB |
| alb\_zone\_id | The ID of the zone which ALB is provisioned |
| default\_target\_group\_arn | The default target group ARN |
| http\_listener\_arn | The ARN of the HTTP listener |
| https\_listener\_arn | The ARN of the HTTPS listener |
| listener\_arns | A list of all the listener ARNs |
| security\_group\_id | The security group ID of the ALB |

<!-- markdownlint-restore -->
<!-- markdownlint-disable -->
## Makefile Targets
```text
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint Terraform code

```
<!-- markdownlint-restore -->


## Developing

1. Make changes in terraform files

2. Regenerate documentation

    ```bash
    bash <(curl -s https://terraform.s3.k.miquido.net/update.sh)
    ```

3. Run lint

    ```
    make lint
    ```

## Copyright

Copyright © 2017-2020 [Miquido](https://miquido.com)



### Contributors

|  [![Konrad Obal][k911_avatar]][k911_homepage]<br/>[Konrad Obal][k911_homepage] |
|---|

  [k911_homepage]: https://github.com/k911
  [k911_avatar]: https://github.com/k911.png?size=150



  [logo]: https://www.miquido.com/img/logos/logo__miquido.svg
  [website]: https://www.miquido.com/
  [gitlab]: https://gitlab.com/miquido
  [github]: https://github.com/miquido
  [bitbucket]: https://bitbucket.org/miquido


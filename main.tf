
module "alb" {
# TODO
# Temporary. It is taken from fork containing migration to TF 0.12. 
# When Pull Request https://github.com/cloudposse/terraform-aws-alb/pull/26 is merged to the original Cloudposse repo, 
# source will can be reverted to cloudposse back.
#  source    = "git::https://github.com/cloudposse/terraform-aws-alb.git?ref=tags/0.5.0"
  source    = "git::https://github.com/techfishio/terraform-aws-alb.git?ref=tags/0.6.0"
  name      = var.name
  namespace = var.project
  stage     = var.environment
  tags      = var.tags

  http_port                    = var.http_port
  http_enabled                 = var.http_enabled
  http_ingress_cidr_blocks     = var.http_ingress_cidr_blocks
  http_ingress_prefix_list_ids = var.http_ingress_prefix_list_ids

  https_port                    = var.https_port
  https_enabled                 = var.https_enabled
  https_ingress_cidr_blocks     = var.https_ingress_cidr_blocks
  https_ingress_prefix_list_ids = var.https_ingress_prefix_list_ids
  https_ssl_policy              = var.https_ssl_policy
  http2_enabled                 = var.http2_enabled

  health_check_path                = var.health_check_path
  health_check_timeout             = var.health_check_timeout
  health_check_healthy_threshold   = var.health_check_healthy_threshold
  health_check_unhealthy_threshold = var.health_check_unhealthy_threshold
  health_check_interval            = var.health_check_interval
  health_check_matcher             = var.health_check_matcher

  access_logs_prefix                      = var.access_logs_prefix
  access_logs_enabled                     = var.access_logs_enabled
  access_logs_region                      = var.region
  alb_access_logs_s3_bucket_force_destroy = var.access_logs_s3_bucket_force_destroy

  target_group_port                 = var.target_group_port
  deregistration_delay              = var.deregistration_delay
  deletion_protection_enabled       = var.deletion_protection_enabled
  internal                          = var.internal
  idle_timeout                      = var.idle_timeout
  cross_zone_load_balancing_enabled = var.cross_zone_load_balancing_enabled
  ip_address_type                   = var.ip_address_type
  vpc_id                            = var.vpc_id
  subnet_ids                        = var.subnet_ids
  security_group_ids                = var.security_group_ids
  certificate_arn                   = var.acm_certificate_arn
}

resource "aws_lb_listener_rule" "redirect_http_to_https" {
  count = var.enable_redirect_http_to_https == "true" ? 1 : 0

  listener_arn = module.alb.http_listener_arn
  priority     = var.redirect_http_to_https_priority

  action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = var.redirect_http_to_https_status_code
    }
  }

  condition {
    field  = "host-header"
    values = ["*${var.domain}"]
  }
}

resource "aws_s3_bucket_public_access_block" "alb-logs" {
  bucket                  = module.alb.access_logs_bucket_id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


locals {
  default_sans = ["*.${var.domain}"]
  sans         = "${split(",", length(var.subject_alternative_names) == 0 ? join(",", local.default_sans) : join(",", var.subject_alternative_names))}"
}

module "acm-request" {
  source = "git::https://github.com/k911/terraform-aws-acm-request-certificate.git?ref=tags/0.4.0-tf011"

  enabled                           = "${var.acm_certificate_request_enabled}"
  domain_name                       = "${var.domain}"
  validation_method                 = "${var.validation_method}"
  ttl                               = "${var.domain_ttl}"
  subject_alternative_names         = "${local.sans}"
  tags                              = "${var.tags}"
  wait_for_certificate_issued       = "${var.wait_for_certificate_issued}"
  process_domain_validation_options = "${var.process_domain_validation_options}"
}

module "alb" {
  source    = "git@github.com:cloudposse/terraform-aws-alb?ref=0.2.6"
  name      = "${var.name}"
  namespace = "${var.project}"
  stage     = "${var.environment}"
  tags      = "${var.tags}"

  ip_address_type           = "ipv4"

  http_port                    = "${var.http_port}"
  http_enabled                 = "${var.http_enabled}"
  http_ingress_cidr_blocks     = "${var.http_ingress_cidr_blocks}"
  http_ingress_prefix_list_ids = "${var.http_ingress_prefix_list_ids}"

  https_port                    = "${var.https_port}"
  https_enabled                 = "${var.https_enabled}"
  https_ingress_cidr_blocks     = "${var.https_ingress_cidr_blocks}"
  https_ingress_prefix_list_ids = "${var.https_ingress_prefix_list_ids}"

  http2_enabled             = "true"

  vpc_id             = "${var.vpc_id}"
  subnet_ids         = "${var.subnet_ids}"
  security_group_ids = "${var.security_group_ids}"
  access_logs_region = "${var.region}"
  certificate_arn    = "${var.acm_certificate_request_enabled == "true" ? module.acm-request.arn : var.acm_certificate_arn}"
}

resource "aws_lb_listener_rule" "redirect_http_to_https" {
  count = "${var.enable_redirect_http_to_https == "true" ? 1 : 0}"

  listener_arn = "${module.alb.http_listener_arn}"
  priority     = "${var.redirect_http_to_https_priority}"

  action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "${var.redirect_http_to_https_status_code}"
    }
  }

  condition {
    field  = "host-header"
    values = ["*${var.domain}"]
  }
}

resource "aws_s3_bucket_public_access_block" "alb-logs" {
  bucket                  = "${module.alb.access_logs_bucket_id}"
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

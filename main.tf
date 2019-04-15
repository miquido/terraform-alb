module "acm-request" {
  source = "git@github.com:cloudposse/terraform-aws-acm-request-certificate?ref=0.1.3"

  domain_name               = "${var.domain}"
  validation_method         = "DNS"
  ttl                       = "300"
  subject_alternative_names = ["*.${var.domain}"]
  tags                      = "${var.tags}"
}

module "alb" {
  source    = "git@github.com:cloudposse/terraform-aws-alb?ref=0.2.6"
  name      = "${var.name}"
  namespace = "${var.project}"
  stage     = "${var.environment}"
  tags      = "${var.tags}"

  ip_address_type = "ipv4"
  http_port       = "80"
  http_enabled    = "true"
  http_port       = "80"
  https_enabled   = "true"
  https_port      = "443"
  http2_enabled   = "true"

  vpc_id             = "${var.vpc_id}"
  subnet_ids         = "${var.subnet_ids}"
  security_group_ids = "${var.security_group_ids}"
  access_logs_region = "${var.region}"
  certificate_arn    = "${module.acm-request.arn}"
}

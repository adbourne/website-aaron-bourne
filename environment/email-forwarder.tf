module "terraform-aws-ses-lambda-forwarder" {
  source = "github.com/cloudposse/terraform-aws-ses-lambda-forwarder"
  domain = "${var.root_domain_name}"
  region = "${var.aws_region}"
  relay_email = "${var.relay_email_address}"
  namespace = "aaronbourne"
  stage = "prod"
  forward_emails = {
    "administrator@${var.root_domain_name}" = "${var.private_email_address}"
    "hostmaster@${var.root_domain_name}" = "${var.private_email_address}"
    "postmaster@${var.root_domain_name}" = "${var.private_email_address}"
    "webmaster@${var.root_domain_name}" = "${var.private_email_address}"
    "admin@${var.root_domain_name}" = "${var.private_email_address}"
    "contact@${var.root_domain_name}" = "${var.private_email_address}"
  }
}
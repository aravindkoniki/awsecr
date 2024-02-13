provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

module "ecr" {
  source               = "../../module"
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability
  scan_on_push         = var.scan_on_push
  encryption_type      = var.encryption_type
  lifecycle_policy     = jsonencode(var.lifecycle_policy)
  timeouts_delete      = var.timeouts_delete
  timeouts             = var.timeouts
  tags                 = var.tags
}
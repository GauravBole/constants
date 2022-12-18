data "aws_caller_identity" "current" {}
data "aws_region" "current_region" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "account_region" {
  value = data.aws_region.current_region.name
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}
# https://stackoverflow.com/questions/51967311/terraform-use-data-source-output-in-variable-default
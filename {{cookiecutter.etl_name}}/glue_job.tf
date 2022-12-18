module "glue_etl_job" {
  source = "./modules/glue"

  aws_account_id = local.aws_account_id
  environmanet   = var.environmanet
  job_name       = format("%s_%s", var.project_name, var.environmanet)
  code_bucket    = var.code_bucket
  script_file    = "demo.py" #file should be in project scripts folder
  glue_role_arn  = aws_iam_role.glue_service.arn

  default_arguments = {
    "--TempDir"     = format("s3://%s/temp_dir/", var.code_bucket)
    "--account_id"  = local.aws_account_id
    "--database"    = var.athena_database
    "--code_bucket" = var.code_bucket
    "--source_path"      = format("s3://%s/source/", var.code_bucket)
    "--destination_path" = format("s3://%s/destination/", var.code_bucket)
    # "--extra-py-files" = file s3 path for extra custome package
  }
}

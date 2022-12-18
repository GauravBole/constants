module "glue_etl_job" {
  source = "./modules/glue"

  aws_account_id = local.aws_account_id
  environmanet   = var.environmanet
  job_name       = format("%s_%s", var.project_name, var.environmanet)
  code_bucket    = local.code_bucket
  script_bucket = local.bucket_name
  script_file    = "demo.py" #file should be in project scripts folder
  glue_role_arn  = aws_iam_role.glue_service.arn

  default_arguments = {
    "--TempDir"     = format("s3://%s/temp_dir/", var.code_bucket)
    "--account_id"  = local.aws_account_id
    "--database"    = var.athena_database
    "--code_bucket" = local.code_bucket
    "--source_path"      = format("s3://%s/source/", local.bucket_name)
    "--destination_path" = format("s3://%s/destination/", local.bucket_name)
    # "--extra-py-files" = file s3 path for extra custome package
  }
}

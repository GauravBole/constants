resource "aws_glue_job" "glue_job" {
  name     = var.job_name
  role_arn = var.glue_role_arn

  glue_version = "3.0"
  worker_type       = var.worker_type
  number_of_workers = var.number_of_workers
  max_retries       = var.max_retries
  command {
    python_version  = 3
    script_location = format("s3://%s/scripts/%s", var.code_bucket,var.script_file)
  }

  default_arguments = merge({
    "--enable-auto-scaling"                   = "false"
    "--enable-continuous-cloudwatch-log"      = "true"
    "--enable-continuous-log-filter"          = "true"
    "--enable-metrics"                        = "true"
    "--enable-s3-parquet-optimized-committer" = "true"
    "--enable-spark-ui"                       = "false"
    "--env"                                   = var.environmanet
    "--job-bookmark-option"                   = var.job_bookmark
    "--job-language"                          = "python"
    "--additional-python-modules"             = "awswrangler"
    },
    var.default_arguments
  )

  execution_property {
    max_concurrent_runs = var.max_concurrent_runs
  }

  tags = merge({
    Name = var.job_name
  }, var.tags)

}

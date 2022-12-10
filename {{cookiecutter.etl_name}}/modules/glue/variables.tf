variable "aws_account_id" {

}

variable "code_bucket" {
  # default = "{{cookiecutter.etl_name}}"
  default = "mybucket-989390415418"
}

variable "code_s3_prefix" {
  # default = "{{cookiecutter.etl_name}}"
  default = "etl"
}

variable "default_arguments" {
  default = {}
}

variable "environmanet" {
  default = "dev"
}

variable "glue_role_arn" {

}

variable "job_bookmark" {
  default = "job-bookmark-disable"
}

variable "job_name" {

}

variable "max_retries" {
  default = 0
}

variable "max_concurrent_runs" {
  default = 1
}

variable "number_of_workers" {
  default = 2
}

variable "region_name" {
  # default = "{{cookiecutter.region}}"
  default = "us-east-1"
}


variable "project_name" {
  # default = "{{cookiecutter.etl_name}}"
  default = "default_projetct"
}

variable "script_file" {

}

variable "tags" {
  default = {}
}

variable "worker_type" {
  # default = "{{cookiecutter.worker_type}}"
  default = "Standard"
}
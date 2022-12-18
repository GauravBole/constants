variable "aws_account_id" {
  default = ""
}

variable "code_bucket" {
  default = "{{cookiecutter.etl_name}}"
}

variable "code_s3_prefix" {
  default = "{{cookiecutter.etl_name}}"
}

variable "default_arguments" {
  default = {}
}

variable "environmanet" {
  default = "dev"
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
  default =  "{{cookiecutter.region_name}}"
}


variable "project_name" {
  default = "{{cookiecutter.etl_name}}"
}

variable "script_file" {

}

variable "tags" {
  default = {}
}

variable "worker_type" {
  default = "Standard"
}
variable "glue_role_arn" {

}
variable "script_bucket" {

}
variable "aws_account_id" {
    default = ""
}

variable "code_bucket" {
  default =  "{{cookiecutter.etl_name}}"
}

variable "environmanet" {
  default = "dev"
}

variable "project_name" {
  default =  "{{cookiecutter.etl_name}}"
}

variable "athena_database" {
  default =  "{{cookiecutter.database_name}}"
}
variable "script_bucket" {

}
# terraform {
#   backend "s3" {
#     bucket = "{{cookiecutter.etl_name}}-tf"
#     key    = "terraform.tfstate"
#     region = "{{cookiecutter.region}}"
#   }
# }

terraform {
  backend "s3" {
    bucket = "backend-989390415418"
    key    = "terraform.tfstate"
  }
}

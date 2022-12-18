terraform {
  backend "s3" {
    bucket = "{{cookiecutter.etl_name}}-tf"
    key    = "terraform.tfstate"
  }
}


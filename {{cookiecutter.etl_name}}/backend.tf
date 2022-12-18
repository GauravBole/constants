terraform {
  backend "s3" {
    bucket = "{{cookiecutter.backend_bucket_name}}"
    key    = "terraform.tfstate"
    region = "{{cookiecutter.region_name}}"
  }
}


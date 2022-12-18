terraform {
  backend "s3" {
    bucket = "{{cookiecutter.etl_name}}-tf"
    key    = "terraform.tfstate"
    # region = "{%- if not cookiecutter.region_name -%} us-east-1 {%- endif -%}"
    region = "{{cookiecutter.region_name}}" != "" ? "{{cookiecutter.region_name}}": "us-east-1"
  }
}


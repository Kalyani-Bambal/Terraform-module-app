# dev infrastructure

module "infra-app-dev" {
  source = "./infra-app"

  env            = "dev"
  bucket_name    = "kalyani-infra-app-bucket"
  hash_key       = "studentID"
  instance_count = 1
  instance_type  = "t3.micro"
  ami_id         = "ami-0a71e3eb8b23101ed"
}

module "infra-app-prd" {
  source = "./infra-app"

  env            = "prd"
  bucket_name    = "kalyani-infra-app-bucket"
  hash_key       = "studentID"
  instance_count = 2
  instance_type  = "t3.small"
  ami_id         = "ami-0a71e3eb8b23101ed"
}

module "infra-app-stg" {
  source = "./infra-app"

  env            = "stg"
  bucket_name    = "kalyani-infra-app-bucket"
  hash_key       = "studentID"
  instance_count = 1
  instance_type  = "t3.small"
  ami_id         = "ami-0a71e3eb8b23101ed"
}
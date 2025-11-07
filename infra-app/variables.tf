variable "env" {
  description = "The environment for the infra"
  type    = string

}

variable "bucket_name" {
  description = "The bucket_name for the infra"
  type    = string
}

variable "instance_count" {
   description = "The number of ec2 instance"
  type    = number
}

variable "hash_key" {
  description = "The hash key for the DynamoDB infra"
  type    = string
}

 variable "instance_type" {
  description = "The instance type for ec2 infra"
  type    = string
}

variable "ami_id" {
 description = "The instance AMI ID for ec2 infra"
 type    = string
}
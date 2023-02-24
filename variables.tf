# provider variable
variable "aws_region" {
  description = "Configuring AWS as provider"
  type        = string
  default     = "us-east-1"
}

# keys to the castle variable
variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "vpc_id" {
  default = ""
}

variable "vpc_cidr" {
  description = "CIDR block for NaoProd"
  type        = string
  default     = "10.0.0.0/16"
}

# # availability zones variable
# variable "availability_zones" {
#   type    = string
#   default = "us-east-1a"
# }
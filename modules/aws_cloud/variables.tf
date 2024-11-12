variable "access_key" {
  description = "Accesskey for AWS Cloud."
  type = string
  sensitive = true
}

variable "secret_key" {
  description = "Secret key for AWS Cloud."
  type = string
  sensitive = true
}

variable "aws_region" {
  default = "ap-northeast-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  type        = list(any)
  default     = ["10.0.0.0/24", "10.0.128.0/24"]
  description = "CIDR block for Public Subnet"
}

variable "private_subnets_cidr" {
  type        = list(any)
  default     = ["10.0.16.0/24", "10.0.144.0/24"]
  description = "CIDR block for Private Subnet"
}

variable "secret_folder" {
  type = string
  description = "Folder that containes the secrets."
}

variable "macbook_tls_key_name" {
  type = string
  default = "macbook"
}

variable "macbook_tls_key_filename" {
  type = string
  default = "macbook.key"
}

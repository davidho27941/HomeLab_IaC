variable "address" {
  description = "Host of Self-hosted GitLab."
  type = string
  sensitive = true
}

variable "lock_address" {
  description = "Self-hosted GitLab lock URL."
  type = string
  sensitive = true
}

variable "unlock_address" {
  description = "Self-hosted GitLab unlock URL."
  type = string
  sensitive = true
}

variable "lock_method" {
  description = "Self-hosted GitLab lock method."
  type = string
  sensitive = true
}

variable "unlock_method" {
  description = "Self-hosted GitLab unlock method."
  type = string
  sensitive = true
}

variable "username" {
  description = "Self-hosted GitLab user name."
  type = string
  sensitive = true
}

variable "password" {
  description = "Personal Access Token for Self-hosted GitLab."
  type = string
  sensitive = true
}

variable "registry_username" {
  description = "Self-hosted GitLab user name."
  type = string
  sensitive = true
}

variable "registry_password" {
  description = "Personal Access Token for Self-hosted GitLab."
  type = string
  sensitive = true
}

variable "aws_access_key" {
  description = "Accesskey for AWS Cloud."
  type = string
  sensitive = true
}

variable "aws_secret_key" {
  description = "Secret key for AWS Cloud."
  type = string
  sensitive = true
}

variable "secret_folder" {
  description = "Folder that containes the secrets."
  type = string
  default = "/Users/davidho/workplace/HomeLab_IaC/assets/secrets"
}

variable "airflow_web_username" {
  description = "Username for airflow web service."
  type = string
}

variable "airflow_web_password" {
  description = "Password for airflow web service."
  type = string
  sensitive = true
}

variable "airflow_web_email" {
  description = "Email for airflow web service."
  type = string
}

variable "airflow_image_repo" {
  description = "Repository of airflow image."
  type = string
  default = "apache/airflow"
}

variable "airflow_image_tag" {
  description = "Tag of airflow image."
  type = string
  default = "2.10.1"
}

variable "airflow_dns_name" {
  description = "DNS Domain for airflow web service."
  type = string
  default = "airflow.homelab.me"
}
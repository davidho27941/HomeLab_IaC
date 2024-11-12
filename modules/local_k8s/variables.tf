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

variable "spark_dns_name" {
  description = "DNS Domain for airflow web service."
  type = string
  default = "spark.homelab.me"
}
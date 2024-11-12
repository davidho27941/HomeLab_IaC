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


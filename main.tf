module "macbook" {
  source = "./modules/macbook"
}

module "remote_gpu_docker" {
  source = "./modules/gpu_docker"

  registry_username = var.registry_username
  registry_password = var.registry_password
}

module "local_k8s" {
  source = "./modules/local_k8s"

  registry_username = var.registry_username
  registry_password = var.registry_password

  airflow_web_email = var.airflow_web_email
  airflow_web_username = var.airflow_web_username
  airflow_web_password = var.airflow_web_password

  airflow_image_repo = var.airflow_image_repo
  airflow_image_tag = var.airflow_image_tag

  airflow_dns_name = var.airflow_dns_name
}


module "aws" {
  source = "./modules/aws_cloud"

  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  secret_folder = var.secret_folder
}
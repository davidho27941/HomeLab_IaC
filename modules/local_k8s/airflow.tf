resource "helm_release" "airflow" {
    repository = "https://airflow.apache.org"
    chart = "airflow"
    name = "airflow"

    namespace = "airflow"
    create_namespace = true

    set {
        name = "defaultAirflowRepository"
        value = var.airflow_image_repo
    }
    
    set {
        name = "defaultAirflowTag"
        value = var.airflow_image_tag
    }

    set {
        name = "airflowVersion"
        value = var.airflow_image_tag
    }

    set {
        name = "images.airflow.repository"
        value = var.airflow_image_repo
    }
    
    set {
        name = "images.airflow.tag"
        value = var.airflow_image_tag
    }

    set {
        name = "executor"
        value = "KubernetesExecutor"
    }

    set {
        name = "webserver.enabled"
        value = "true"
    }

    set {
        name = "config.webserver.expose_config"
        value = "true"
    }

    set {
        name = "webserver.defaultUser.username"
        value = var.airflow_web_username
    }

    set {
        name = "webserver.defaultUser.email"
        value = var.airflow_web_email
    }

    set {
        name = "webserver.defaultUser.password"
        value = var.airflow_web_password
    }

    set {
        name = "statsd.uid"
        value = "50000"
    }

    set {
        name = "triggerer.persistence.enabled"
        value = "true"
    }

    set {
        name = "triggerer.persistence.size"
        value = "10G"
    }

    set {
        name = "triggerer.persistence.storageClassName"
        value = "longhorn"
    }

    set {
        name = "createUserJob.useHelmHooks"
        value = "false"
    }

    set {
        name = "createUserJob.applyCustomEnv"
        value = "false"
    }

    set {
        name = "migrateDatabaseJob.useHelmHooks"
        value = "false"
    }

    set {
        name = "migrateDatabaseJob.applyCustomEnv"
        value = "false"
    }

    set {
        name = "ingress.web.enabled"
        value = "true"
    }

    set_list {
        name = "ingress.web.hosts"
        value = [var.airflow_dns_name]
    }

    set {
        name = "ingress.web.tls.enabled"
        value = "true"
    }

    set {
        name = "ingress.web.tls.secretName"
        value = kubernetes_manifest.airflow_tls_cert.object.spec.secretName
    }

    set {
        name = "extraEnv"
        value = <<-EOT
        - name: AIRFLOW__CORE__DEFAULT_TIMEZONE
          value: "Asia/Taipei"
        EOT
    }

}

resource "local_file" "airflow_release_note" {
  filename = "/Users/davidho/workplace/HomeLab_IaC/assets/release_notes/airflow/notes.txt"
  content = helm_release.airflow.metadata[0].notes
}
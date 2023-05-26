generate "appengine" {
    path      = "../../modules/common/backend.tf"
    if_exists = "overwrite_terragrunt"
    contents = <<EOF
resource "google_cloud_run_service" "terragrunt" {
  project  = var.project
  name     = "demo-terragrunt-jang"
  location = "asia-northeast1"

  template {
    spec {
      containers {
        image = "asia-northeast1-docker.pkg.dev/cainz-searchrd-dev/prototype-frontend/prototype-webserver:latest"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

EOF
}

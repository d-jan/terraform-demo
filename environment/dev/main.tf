provider "google" {
  project = "cainz-searchrd-dev"
  region  = "asia-northeast1"
}

module "demo" {
  source = "../../modules/common"
  service_name = var.service_name
}
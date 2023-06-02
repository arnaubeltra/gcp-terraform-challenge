module "cloud_builds" {
  source  = "./modules/cloud-build"
  gcp_project = var.gcp_project
  builds  = var.builds
}
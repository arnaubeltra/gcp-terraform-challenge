module "cloud_builds" {
  source = "./modules/cloud-build"

  cloudbuild_builds = [
    {
      name     = "tf-trigger-Backend"
      project  = var.gcp_project
      location = var.gcp_region
      github = [
        {
          owner = var.git_repo_owner
          name  = "Backend"
          push = [
            {
              branch = "^main$"
            }
          ]
        }
      ]
      source_to_build = [
        {
          uri = "https://github.com/${var.git_repo_owner}/Backend"
          ref       = "refs/heads/main"
          repo_type = "GITHUB"
        }
      ]
      git_file_source = [
        {
          path      = "cloudbuild.yaml"
          uri       = "https://github.com/${var.git_repo_owner}/Backend"
          revision  = "refs/heads/main"
          repo_type = "GITHUB"
        }
      ]
    },

    {
      name     = "tf-trigger-Frontend"
      project  = var.gcp_project
      location = var.gcp_region
      github = [
        {
          owner = var.git_repo_owner
          name  = "Frontend"
          push = [
            {
              branch = "^main$"
            }
          ]
        }
      ]
      source_to_build = [
        {
          uri = "https://github.com/${var.git_repo_owner}/Frontend"
          ref       = "refs/heads/main"
          repo_type = "GITHUB"
        }
      ]
      git_file_source = [
        {
          path      = "cloudbuild.yaml"
          uri       = "https://github.com/${var.git_repo_owner}/Frontend"
          revision  = "refs/heads/main"
          repo_type = "GITHUB"
        }
      ]
    }
  ]
}
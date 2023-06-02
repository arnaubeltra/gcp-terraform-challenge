# Terraform Challenge

The challenge consists on building a Terraform Cloud Build module that is reusable and scalable, so that allows to perform multiple builds without editing the source code of the module. The module can only be called once from the `main.tf` file.

This challenge has been done by reusing the previous Terraform code developed for the Cloud Challenge - Contact List (2023).

## Example of usage

Example of the `main.tf`, that calls the Cloud Build module:

```hcl
module "cloud_builds" {
  source  = "./modules/cloud-build"
  gcp_project = var.gcp_project
  builds  = var.builds
}
```

Example of the `terraform.tfvars` to set all values needed:

```hcl
gcp_project = "project-id"

builds = {

  "tf-trigger-Backend" = {
    location = "europe-west6"
    github = [{
      owner = "gft-contact-list"
      name  = "Backend"
      push = [{
        branch = "^main$"
      }]
    }]
    source_to_build = [{
      uri       = "https://github.com/gft-contact-list/Backend"
      ref       = "refs/heads/main"
      repo_type = "GITHUB"
    }]
    git_file_source = [{
      path      = "cloudbuild.yaml"
      uri       = "https://github.com/gft-contact-list/Backend"
      revision  = "refs/heads/main"
      repo_type = "GITHUB"
    }]
  },

  "tf-trigger-Frontend" = {
    location = "europe-west6"
    github = [{
      owner = "gft-contact-list"
      name  = "Frontend"
      push = [{
        branch = "^main$"
      }]
    }]
    source_to_build = [{
      uri       = "https://github.com/gft-contact-list/Frontend"
      ref       = "refs/heads/main"
      repo_type = "GITHUB"
    }]
    git_file_source = [{
      path      = "cloudbuild.yaml"
      uri       = "https://github.com/gft-contact-list/Frontend"
      revision  = "refs/heads/main"
      repo_type = "GITHUB"
    }]
  }

}
```

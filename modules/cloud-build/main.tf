resource "google_cloudbuild_trigger" "cloudbuild_trigger" {
  for_each = var.builds

  name     = each.key
  location = each.value.location
  project  = var.gcp_project

  dynamic "github" {
    for_each = lookup(each.value, "github", {})
    content {
      owner = github.value.owner
      name  = github.value.name
      dynamic "push" {
        for_each = lookup(github.value, "push", null)
        content {
          branch = push.value.branch
        }
      }
    }
  }

  dynamic "source_to_build" {
    for_each = lookup(each.value, "source_to_build", {})
    content {
      uri       = source_to_build.value.uri
      ref       = source_to_build.value.ref
      repo_type = source_to_build.value.repo_type
    }
  }

  dynamic "git_file_source" {
    for_each = lookup(each.value, "git_file_source", {})
    content {
      path      = git_file_source.value.path
      uri       = git_file_source.value.uri
      repo_type = git_file_source.value.repo_type
      revision  = git_file_source.value.revision
    }
  }
}
resource "google_cloudbuild_trigger" "cloudbuild_trigger" {
  for_each = { for build in var.cloudbuild_builds : build.name => build }

  name     = each.value.name
  location = each.value.location
  project  = each.value.project

  dynamic "github" {
    for_each = lookup(each.value, "github", {})
    content {
      owner = lookup(github.value, "owner", {})
      name  = lookup(github.value, "name", null)
      dynamic "push" {
        for_each = lookup(github.value, "push", null)
        content {
          branch = lookup(push.value, "branch", null)
        }
      }
    }
  }

  dynamic "source_to_build" {
    for_each = lookup(each.value, "source_to_build", {})
    content {
      uri       = lookup(source_to_build.value, "uri", null)
      ref       = source_to_build.value.ref
      repo_type = source_to_build.value.repo_type
    }
  }

  dynamic "git_file_source" {
    for_each = lookup(each.value, "git_file_source", {})
    content {
      path      = git_file_source.value.path
      uri       = lookup(git_file_source.value, "uri", null)
      repo_type = git_file_source.value.repo_type
      revision  = lookup(git_file_source.value, "revision", null)
    }
  }
}
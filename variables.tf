variable "gcp_project" {
  type        = string
  default     = ""
  description = "Google Cloud project ID"
}

variable "gcp_region" {
  type        = string
  default     = "europe-west6"
  description = "Google Cloud region"
}

variable "gcp_zone" {
  type        = string
  default     = "europe-west6-c"
  description = "Google Cloud zone"
}

variable "git_repo_owner" {
  type        = string
  default     = "gft-contact-list"
  description = "Owner of the git repository"
}

variable "builds" {
  description = "CloudBuild list of Builds to perform"
  type = map(object({
    location = optional(string)
    github = optional(list(object({
      owner = optional(string)
      name  = optional(string)
      push = optional(list(object({
        branch = optional(string)
      })))
    })))
    source_to_build = optional(list(object({
      uri       = optional(string)
      ref       = string
      repo_type = string
    })))
    git_file_source = optional(list(object({
      path      = string
      uri       = optional(string)
      repo_type = string
      revision  = optional(string)
    })))
  }))
}
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
  default     = ""
  description = "Owner of the git repository"
}

variable "git_repo_names" {
    type = list(string)
    default = [""]
    description = "Names of the git repositories"
}
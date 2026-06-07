variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "modern-devsecops-chatbot"
}

variable "github_org" {
  description = "Ton username GitHub"
  type        = string
}

variable "github_repo" {
  description = "Nom du repo GitHub"
  type        = string
}

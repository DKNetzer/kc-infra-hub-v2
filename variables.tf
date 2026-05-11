variable "hub_project" {
  type        = string
  description = "The Project ID of the Hub project"
  default     = "jutomate-playground-hub"
}

variable "location" {
  type        = string
  description = "The GCP region for the resources"
  default     = "us-central1"
}
# Specify the provider (GCP, AWS, Azure)
provider "google" {
  credentials = file("tech-rnd-project-905528d3cdf2.json")
  project     = var.project01
  region = "us-central1"
}

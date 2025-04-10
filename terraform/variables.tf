variable "credentials" {
  description = "credentials for project"
  default     = "/workspace/my_creds.json"
}
variable "gcs_bucket_name" {
  description = "bucket name"
  default     = "severestorms-tf-bucket"
}
variable "bq_dataset_name" {
  description = "my big query dataset name"
  default     = "NOAASevereStorms"

}
variable "gcs_storage_class" {
  description = "bucket storage class"
  default     = "STANDARD"
}
variable "location" {
  description = "project location"
  default     = "US"
}
variable "project" {
  description = "project-id"
  default     = "severestorms"
}
variable "region" {
  description = "project region"
  default     = "us-central1"
}
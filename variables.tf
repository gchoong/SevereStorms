variable "credentials" {
  description = "credentials for project"
  default     = "/Users/gchoong/Projects/dezoomcourse2025/tf-demo/keys/my_creds.json"
}
variable "gcs_bucket_name" {
  description = "bucket name"
  default     = "intense-dolphin-448915-e9-tf-bucket"
}
variable "bq_dataset_name" {
  description = "my big query dataset name"
  default     = "dataset"

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
  description = "project location"
  default     = "intense-dolphin-448915-e9"
}
variable "region" {
  description = "project region"
  default     = "us-central1"
}
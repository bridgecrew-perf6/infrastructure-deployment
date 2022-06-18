variable "folder_id" {
  description = "The ID of the folder to operate under"
  type        = string
  sensitive   = true
}

variable "cloud_id" {
  description = "The ID of the cloud to operate under"
  type        = string
  sensitive   = true
}

variable "auth_token" {
  description = "Security token or IAM token used for authentication in Yandex.Cloud"
  type        = string
  sensitive   = true
}

variable "zone" {
  description = "Availability zone"
  type        = string
  default     = "ru-central1-a"
}

variable "bucket" {
  description = "The name of the bucket that stores the Terraform state file"
  type        = string
  sensitive   = true
}

variable "access_key" {
  description = "The static key ID"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "The private key of static key"
  type        = string
  sensitive   = true
}

variable "ssh_credentials" {
  description = "Credentials for connecting to instances"
  type = object({
    user        = string
    private_key = string
    pub_key     = string
  })
  default = {
    user        = "ubuntu"
    private_key = "~/.ssh/id_rsa"
    pub_key     = "~/.ssh/id_rsa.pub"
  }
  sensitive   = true
}

variable "instance_family_image" {
  description = "Instance image"
  type        = string
  default     = "ubuntu-2004-lts"
}


variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project = "expense"
    Environment = "dev"
    Terraform = "true"
    Component = "frontend"
  }
}

variable "zone_name" {
  default = "rajasekhar.store"
}

#created as part of jenkins CD
variable "app_version"{

}
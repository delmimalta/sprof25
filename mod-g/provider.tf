terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "2.1.0"
    }
  }
}

provider "openstack" {
  auth_url    = var.OS_AUTH_URL
  tenant_name = var.OS_PROJECT_NAME
  user_name   = var.OS_USERNAME
  password    = var.OS_PASSWORD
  insecure    = true
}

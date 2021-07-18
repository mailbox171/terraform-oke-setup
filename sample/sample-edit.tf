#https://github.com/oracle-terraform-modules/terraform-oci-oke/issues/251 

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "parent_compartment_ocid" {}
variable "region" {}

variable "ssh_private_key_path" {}
variable "ssh_public_key_path" {}

terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "~> 4.5.0"
    }
  }
}

provider "oci" {
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  region               = var.region
}

resource "oci_identity_compartment" "compartment" {
  name           = "testcompartment"
  description    = "Test Compartment"
  compartment_id = var.parent_compartment_ocid
}

module "oke" {
  # Settings for configuring this remote module
  source                  = "oracle-terraform-modules/oke/oci"
  version                 = "2.3.3"

  # Identity and access
  api_fingerprint         = var.fingerprint
  api_private_key_path    = var.private_key_path
  compartment_id          = oci_identity_compartment.compartment.id
  tenancy_id              = var.tenancy_ocid
  user_id                 = var.user_ocid

  # SSH Keys
  ssh_private_key_path    = var.ssh_private_key_path
  ssh_public_key_path     = var.ssh_public_key_path

  # General OCI
  label_prefix            = "test"
  region                  = var.region

  # OCI Networking
  vcn_cidr                = "10.0.0.0/16"
  vcn_dns_label           = "test"
  vcn_name                = "test-vcn"

  # Bastion Host
  bastion_access                = "ANYWHERE"
  bastion_image_id              = "Autonomous"
  bastion_enabled               = false
  bastion_notification_enabled  = true
  bastion_notification_endpoint = "my.email@foo.com"
  bastion_notification_protocol = "EMAIL"
  bastion_notification_topic    = "bastion"
  bastion_package_upgrade       = true
  bastion_shape                 = "VM.Standard.E2.1"
  bastion_timezone              = "America/Los_Angeles"

  # Admin Host
  operator_enabled               = false
  operator_image_id              = "Oracle"
  operator_instance_principal    = true
  operator_notification_enabled  = false
  operator_notification_endpoint = "my.email@foo.com"
  operator_notification_protocol = "EMAIL"
  operator_notification_topic    = "operator"
  operator_package_upgrade       = true
  operator_shape                 = "VM.Standard.E2.1" #var.operator_shape
  operator_timezone              = "America/Los_Angeles" #var.operator_timezone

  # Availability Domains
#domain
  availability_domains = {
    bastion  = 1
    operator = 1
  }

  # Tagging
  tags = {
    # vcn, bastion and operator tags are required. Add more tags in each as desired
    vcn = {
      environment = "dev"
    }
    bastion = {
      environment = "dev"
      role        = "bastion"
    }
    operator = {
      environment = "dev"
      role        = "operator"
    }
  }

  # OKE
  admission_controller_options = {
    PodSecurityPolicy = true
  }
  allow_node_port_access  = false
  allow_worker_ssh_access = true
  cluster_name            = "k8s1"
  check_node_active       = "one"
  dashboard_enabled       = false
  kubernetes_version      = "v1.18.10"
  node_pools = {
    np1 = {
      shape               = "VM.Standard.E3.Flex",
      ocpus               = 1,
      memory              = 32,
      node_pool_size      = 1,
      boot_volume_size    = 50
    }
  }
  node_pool_image_id      = "ocid1.image.oc1.iad.aaaaaaaapulaxjedwo2y3koeli6zq6evql6rropyxpni3wu44i2rbffgxgza"
  worker_mode             = "private"

  # OKE Load Balancers
#balancers
  lb_subnet_type          = "public"
  preferred_lb_subnets    = "public"
//  public_lb_ports         = [443, 8883]
  waf_enabled             = false

  # OCIR
//  secret_id               = "" # TODO Add this to vault!!
//  email_address           = "my.email@foo.com"
//  tenancy_name            = "mytenancy"
//  username                = "myuser"

  # Calico
  calico_version = "3.12"
  calico_enabled = false

  # Kubernetes Metrics Server
  metricserver_enabled = false

  # KMS Integration
  use_encryption = false
  existing_key_id = ""

  # Service Account
  create_service_account               = false
  service_account_name                 = "myaccountname"
  service_account_namespace            = "myaccountnamespace"
  service_account_cluster_role_binding = "cicd"
}
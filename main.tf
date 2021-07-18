module "oke" {
  # Settings for configuring this remote module
  source  = "oracle-terraform-modules/oke/oci"
  version = "3.2.0"


  # Identity and access
  api_fingerprint      = var.api_fingerprint
  api_private_key_path = var.api_private_key_path
  compartment_id       = var.compartment_id
  tenancy_id           = var.tenancy_id
  user_id              = var.user_id


  # SSH Keys
  ssh_private_key_path = var.ssh_private_key_path
  ssh_public_key_path  = var.ssh_public_key_path


  # General OCI Environment 
  label_prefix = var.label_prefix
  region       = var.region

  #VCN
  vcn_cidr      = var.vcn_cidr
  vcn_dns_label = var.vcn_dns_label
  vcn_name      = var.vcn_name


  #BASTION
  bastion_shape    = var.bastion_shape
  bastion_timezone = var.bastion_timezone


  #OPERATOR DISABLED 
  operator_enabled  = false
  operator_shape    = var.operator_shape
  operator_timezone = var.operator_timezone

  #DISABLE SIGNED IMAGES
  #OKE also supports enforcing the use of signed images
  use_signed_images = false
  image_signing_keys = []
  #image_signing_keys = ["ocid1.key.oc1....", "ocid1.key.oc1...."]

  #Configure KMS Integration parameters
  #The KMS integration parameters control whether OCI Key Management Service will be used for encrypting Kubernetes secrets. 
  #Additionally, the bastion and operator hosts must be enabled as well as instance_principal on the operator.
  #bastion_enabled = true
  #operator_enabled = true
  operator_instance_principal = false 
  use_encryption = false 
  existing_key_id = "<existing_key_id>"


  #node_pools
  node_pools = var.node_pools
  #node_pool_os = var.node_pool_os
  #node_pool_os_version = var.node_pool_os_version 
  node_pool_image_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaprt6uk32tylin3owcddyllao3uthmo7vheqepeybvjj6to7xkdgq"


}
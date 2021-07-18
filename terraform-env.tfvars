# Identity and access parameters

api_fingerprint = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

api_private_key_path = "~/keys/oracleidentitycloudservice_francesco.costa-07-07-11-37.pem"

region = "eu-frankfurt-1"

tenancy_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

user_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"


# general oci parameters

compartment_id = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

label_prefix = "dev"


# ssh keys

ssh_private_key_path = "~/keys/ssh-key-2021-07-01.key"

ssh_public_key_path = "~/keys/ssh-key-2021-07-01.key.pub"


#node pools

node_pools = {
  #np1 = { shape = "VM.Standard.E3.Flex", ocpus = 2, memory = 20, node_pool_size = 2, boot_volume_size = 150 }
  #np2 = { shape = "VM.Standard.E2.2", node_pool_size = 2, boot_volume_size = 150, label = { app = "application", name = "test" } }
  #np3 = { shape = "VM.Standard.E2.2", node_pool_size = 1 }
  np1 = { shape = "VM.Standard.E3.Flex", ocpus = 2, memory = 20, node_pool_size = 1, boot_volume_size = 150 }
}



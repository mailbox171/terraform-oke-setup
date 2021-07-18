# Identity and access parameters

api_fingerprint = "13:80:07:f2:0d:7c:73:3e:67:bd:0c:51:07:cb:89:31"

api_private_key_path = "~/keys/oracleidentitycloudservice_francesco.costa-07-07-11-37.pem"

region = "eu-frankfurt-1"

tenancy_id = "ocid1.tenancy.oc1..aaaaaaaaxn3r3dh3lh5n5hyo6tkbtmwjvr4wzlahs3u76c4enhckxhy4kpaa"

user_id = "ocid1.user.oc1..aaaaaaaafuup33u6ecwfcxjj4cwtgwz4nnhq23ig7c6uznegzi5lcneg73lq"


# general oci parameters

compartment_id = "ocid1.compartment.oc1..aaaaaaaawb5bs2tee5hxwyor7evurum3voo6eq5ub73a3fpxvuv4q5zmckra"

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



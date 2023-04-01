# region = "us-east-1"

# vpc_cidr = "172.16.0.0/16"

# enable_dns_support = "true"

# enable_dns_hostnames = "true"

# enable_classiclink = "false" 

# enable_classiclink_dns_support = "false" 

# preferred_number_of_public_subnets  = 2
# preferred_number_of_private_subnets = 2

# tags = {
#   Enviroment      = "production" 
#   Owner-Email     = "memunatu50@gmail.com"
#   Managed-By      = "Terraform"
#   Billing-Account = "805970402286"
# }




region = "us-east-1"

vpc_cidr = "172.16.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

# enable_classiclink = "false"

# enable_classiclink_dns_support = "false"

master-username = "bakare"

master-password = "bakare@1"

preferred_number_of_public_subnets = "2"

preferred_number_of_private_subnets = "4"

# environment = "production"

ami = "ami-09cd747c78a9add63"

keypair = "abiola"

# Ensure to change this to your acccount number
account_no = "805970402286"

db-username = "bakare"

db-password = "devopspbl"

tags = {
  Enviroment      = "production"
  Owner-Email     = "memunatu50@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "805970402286"
}
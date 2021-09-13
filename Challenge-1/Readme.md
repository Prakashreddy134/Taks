1. This terraform script allows to create a linux vm.
2. It uses default network.It create firewall rule to allow traffic on port 22 for souce ranges "0.0.0.0/0"
3. Here we added remote exec to login to instance to get instance details from metadata server and store in the vm in file.
4. All variables are declared in variables.tf and values are stored in terrform.tfvars and main script or resource configuration stored in main.tf

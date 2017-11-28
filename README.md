# Terraform Preperation Openshift Vmware Infrastructure MultiMaster MultiNode and Trigger Ansible
- There are two terraform file vars.tf and instance.tf to create Openshift MultiMaster MultiNode Vmware Infra and then trigger Ansible playbook that has been already prepared before.

`var.tf`
`instance.tf`

Usage

Output the plan before applied like dry-run

`# terraform plan`

Apply

`# terraform apply`

They will occured as below vms

ocmaster-1

ocmaster-2

ocmaster-3

ocinfra-1

ocinfra-2

ocinfra-3

ocnode-1

ocnode-2

ocnode-3

oclb

# Overview:

This is where we store all the terraform scripts for the resouces we need for Dell Powerscale.

## What we want to acheive:

We are showcasing Infrastructure As Code.

Typically, Terraform and git is used to make sure that infrastructure is properly managed and thouroughly documented.

It's a good practice to make sure that:
- The resources can be created with terraform scripts whenever possible.
- Typically, a role like `terrafomer.role` is created.

# Pre-requisite:

## On your development machine:

Your development machine is the computer that you will use to create and/or run the terraform scripts.

- git has been installed on the machine.
- Terraform has been installed on the machine.

## Accesses and permissions:

You need to have credentials for:
- Powerscale

##Step by Step Instructions:

- Define the infrastructure you need.
- Create the infrastructure with Terraform.
- Test that the service is working as expected in the TEST environment.

The terraform state for the resources associated to these terraform scripts will be stored in the file tfstate.

# Resources that we need

## Resources that we create

- Powerscale Filesystem - powerscale_filesystem
- Powerscale Access Zone - powerscale_accesszone
- Powerscale Network Pool - powerscale_networkpool
- Powerscale NFS Export - powerscale_nfs_export
- Powerscale User - powerscale_user
- Powerscale user group - powerscale_user_group  

# How to create resources

## Run terraform scripts.
- At the terminal,
  - Run the foll. in order
      - "terraform init" to load all the modules
      - "terraform validate" to validate the configuration
      - "terraform plan" to create a tfstate plan
      - "terraform apply" to create resources as per the plan

# How to destroy resources

- To destroy a target resource, run
    - terraform destroy -target powerscale_user_group.user_group

# Future developments and To-Dos

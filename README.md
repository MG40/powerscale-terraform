# Overview:

This is where we store all the terraform scripts for the resouces we need for [Dell Powerscale.](https://www.dell.com/en-sg/shop/storage-servers-and-networking-for-business/sf/powerscale)

## What we want to acheive:

We are showcasing Infrastructure As Code.

Typically, Terraform and git is used to make sure that infrastructure is properly managed and thouroughly documented.

It's a good practice to make sure that:
- The resources can be created with terraform scripts whenever possible.
- Typically, a role like `terrafomer.role` is created.

We are showcasing how modules can be used to create resources for Dell Powerscale.

We want to create a NFS export. This can be later used on a Linux machine to mount the NFS export.

## Terraform best practices:

Terraform modules are a game-changer in the world of Infrastructure as Code (IaC). They offer a structured and efficient way to organize and reuse your Terraform configurations, making your infrastructure deployments more reliable, scalable, and maintainable.

### Key Benefits of Using Terraform Modules:

**#### Reusability:**

**Consistent Patterns:** Encapsulate common infrastructure patterns (e.g., filesystem, users, groups) into reusable modules.

**Faster Development:** Avoid repetitive coding by leveraging pre-built modules.

**Reduced Errors:** Minimize human error by using well-tested and standardized modules.

**#### Modularity:**

**Clear Structure:** Break down complex infrastructure into smaller, manageable modules.

**Improved Readability:** Enhance code readability and understanding.

**Easier Maintenance:** Isolate changes and updates to specific modules.

**#### Scalability:**

**Rapid Deployment:** Deploy multiple instances of the same module with different configurations.

**Flexible Customization:** Customize modules to fit various use cases.

**Efficient Scaling:** Easily scale your infrastructure up or down.

**#### Collaboration:**

**Shared Components:** Share modules across teams and projects.

**Standardized Practices:** Promote consistent coding standards and best practices.

**Faster Onboarding:** New team members can quickly learn and contribute.

**#### Testing and Validation:**

**Isolated Testing:** Test modules independently to ensure correctness.

**Accelerated Development:** Identify and fix issues early in the development process.

**Enhanced Reliability:** Deploy with confidence, knowing your infrastructure is well-tested.

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
- Use provider "remote-exec" to mount the NFS export.
- Also, explore other resources that can be created for Dell Powerscale.

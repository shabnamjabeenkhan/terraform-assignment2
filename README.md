# EC2 Deployment with Cloud-Init



## Objective

The objective of this assignment is to use **Terraform** and **cloud-init** to automate the deployment and configuration of an AWS EC2 instance.

Terraform is used to provision the infrastructure, while cloud-init automatically installs and configures software when the EC2 instance starts.

The EC2 instance should come online fully configured without requiring any manual configuration.

---

## Architecture

```text
Terraform
    |
    | Creates
    v
AWS EC2 Instance
    |
    | user_data
    v
Cloud-Init
    |
    |-- Updates packages
    |-- Installs NGINX
    |-- Enables NGINX
    |-- Starts NGINX
    v
Running Web Server
```

---

## Project Structure

```text
.
├── main.tf
├── variables.tf
├── outputs.tf
├── cloud-init.yaml
├── provider.tf
└── README.md
```

---


## How Terraform and Cloud-Init Work Together

The cloud-init file is passed to the EC2 instance using Terraform:

```hcl
user_data = file("${path.module}/cloud-init.yaml")
```

The workflow is:

```text
cloud-init.yaml
       |
       v
Terraform file()
       |
       v
EC2 user_data
       |
       v
EC2 Instance Starts
       |
       v
Cloud-Init Runs
       |
       v
NGINX Installed and Started
```

Terraform is responsible for creating the infrastructure, while cloud-init is responsible for configuring the operating system and installing the required software.

---



## Key Concepts Demonstrated

This project demonstrates:

- Provisioning AWS infrastructure using Terraform
- Creating an EC2 instance
- Using Terraform variables
- Using Terraform outputs
- Passing cloud-init using `user_data`
- Automatically installing software during instance startup
- Automatically starting and enabling NGINX
- Deploying a fully configured EC2 instance without manual post-deployment configuration

---

## Cleanup

The infrastructure can be removed using:

```bash
terraform destroy
```

Terraform will destroy the AWS resources that it manages.

---

## Conclusion

This assignment demonstrates how Terraform and cloud-init can be used together to automate both infrastructure provisioning and instance configuration.

Terraform provisions the EC2 infrastructure and passes the cloud-init configuration through `user_data`. Cloud-init then runs automatically when the instance boots and installs and configures the required software.

This provides a repeatable and automated deployment process where the EC2 instance comes online fully configured without requiring manual setup.

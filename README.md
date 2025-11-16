# ALB Automation Project

This project contains the necessary infrastructure and automation scripts to deploy and configure a web server environment fronted by an Application Load Balancer (ALB).

## Project Structure

The project is organized into two main directories:

-   `infra/`: This directory contains the Terraform code to provision the AWS infrastructure, including the VPC, subnets, security groups, EC2 instances, and the Application Load Balancer.
-   `automation/`: This directory contains the Ansible playbooks used to configure the EC2 instances after they have been provisioned.

## Infrastructure (`infra/`)

The infrastructure is managed using Terraform. The Terraform configuration will create the following resources:

-   A new VPC with public and private subnets.
-   An Application Load Balancer (ALB) in the public subnets.
-   An Auto Scaling group of EC2 instances in the private subnets.
-   Security groups to control traffic between the ALB and the EC2 instances.

### Usage

1.  Navigate to the `infra` directory.
2.  Initialize Terraform: `terraform init`
3.  Review the plan: `terraform plan`
4.  Apply the changes: `terraform apply`

## Automation (`automation/`)

The server configuration is managed using Ansible. The Ansible playbook `playbook/setup-web.yml` performs the following actions on the web servers:

-   Updates the system packages.
-   Installs the Apache web server (`httpd`).
-   Starts and enables the Apache service.
-   Creates a simple `index.html` page.
-   Creates a `healthcheck.html` page for the ALB health checks.

### Usage

1.  Ensure your `inventory/host.ini` file is populated with the IP addresses or DNS names of the EC2 instances created by Terraform.
2.  Navigate to the `automation` directory.
3.  Run the Ansible playbook: `ansible-playbook -i inventory/host.ini playbook/setup-web.yml`

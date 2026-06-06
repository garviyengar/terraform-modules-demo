# Terraform Modules for AWS Infrastructure

Reusable Terraform modules for provisioning AWS infrastructure following Infrastructure as Code (IaC) best practices.

## Overview

This project demonstrates modular Terraform development by separating infrastructure components into reusable modules.

The infrastructure is organized into:

* VPC Module
* EC2 Module
* IAM Module

Separate environments are maintained for development and production deployments.

## Architecture

```text
Development / Production
            │
            ▼
         main.tf
            │
    ┌───────┼────────┐
    ▼       ▼        ▼
  VPC     EC2      IAM
 Module  Module   Module
    │       │        │
    ▼       ▼        ▼
 AWS Infrastructure
```

## Modules

### VPC Module

* VPC Creation
* Networking Configuration
* Subnet Management

### EC2 Module

* EC2 Instance Provisioning
* Security Group Association
* Resource Configuration

### IAM Module

* IAM Users
* IAM Roles
* Permission Management

## Technologies

* Terraform
* AWS
* Infrastructure as Code (IaC)

## Learning Outcomes

* Terraform Modules
* Code Reusability
* Environment Separation
* Infrastructure Organization
* AWS Automation

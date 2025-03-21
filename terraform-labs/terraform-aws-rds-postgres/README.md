# Terraform AWS RDS PostgreSQL

This project creates an Amazon RDS PostgreSQL instance using Terraform with a modular structure.

## Prerequisites
- Terraform >= 1.3.0
- AWS CLI configured with credentials
- S3 bucket and DynamoDB table for remote state

# Project Structure
terraform-aws-rds-postgres/
│── modules/
│   ├── rds/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── security_group.tf
│── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│   ├── prod/
│   │   ├── main.tf
│   │   ├── terraform.tfvars
│── main.tf
│── variables.tf
│── outputs.tf
│── provider.tf
│── backend.tf
│── versions.tf
│── README.md


## Deployment

### Initialize Terraform
```sh
cd environments/dev
terraform init
```

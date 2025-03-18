# 🚀 Terraform AWS RDS PostgreSQL

This Terraform module provisions an **Amazon RDS PostgreSQL** instance with best practices, including encryption, automated backups, and security group configuration.

## 📌 Features
- ✅ **Creates an RDS PostgreSQL database**
- ✅ **Enables Multi-AZ deployment for high availability**
- ✅ **Encrypts storage for security**
- ✅ **Automates daily backups**
- ✅ **Allows custom configurations with Terraform variables**
- ✅ **Creates a dedicated security group for controlled access**

## 📂 Project Structure
terraform-rds-postgres/
│── main.tf               # Root module entry
│── variables.tf          # Input variables
│── outputs.tf            # Output values
│── providers.tf          # AWS provider settings
│── modules/
│   ├── rds/
│   │   ├── main.tf       # RDS resource definition
│   │   ├── variables.tf  # RDS module variables
│   │   ├── outputs.tf    # RDS module outputs

## 🔧 **Prerequisites**
- Terraform v1.0+
- AWS CLI configured with credentials
- An existing **VPC** and **subnet group**

## 🛠️ **Usage**
1️⃣ **Initialize Terraform**
```sh
terraform init
```

# Terraform S3 Bucket Project

This project automates the creation of AWS S3 buckets using Terraform with support for multiple environments (dev/prod). It includes encryption, logging, lifecycle rules, and remote state management.

## 📁 Project Structure
```
terraform-s3/
│── envs/
│   ├── dev.tfvars
│   ├── prod.tfvars
│── modules/
│   ├── s3/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│── main.tf
│── providers.tf
│── variables.tf
│── outputs.tf
│── terraform.tfvars
│── Makefile
│── README.md
```

## 🚀 Features
✅ **Modular Terraform Structure** – Uses `modules/s3` for better reusability  
✅ **Multi-Environment Support** – Configurable via `envs/*.tfvars`  
✅ **S3 Features** – Encryption, Logging, Lifecycle Rules  
✅ **Remote State Storage** – Stores Terraform state in an S3 backend  
✅ **Automated Workflow** – Uses a `Makefile` for easy commands  

## 🔧 Prerequisites
- Terraform (`>= 1.0`)
- AWS CLI (`aws configure` set up for your accounts)
- Make (`sudo apt install make` on Linux/macOS)

## 🏗️ Setup & Usage
### 1️⃣ Initialize Terraform
```sh
make init
```

### 2️⃣ Deploy Infrastructure
Deploy for **development**:
```sh
make deploy ENV=dev
```
Deploy for **production**:
```sh
make deploy ENV=prod
```

### 3️⃣ Destroy Infrastructure
```sh
make destroy ENV=dev
```

### 4️⃣ Format & Validate Code
```sh
make fmt
make validate
```

## 🎯 Environment Configuration
Define environment-specific variables in `envs/dev.tfvars` and `envs/prod.tfvars`:
```hcl
aws_profile_dev = "my-dev-profile"
aws_profile_prod = "my-prod-profile"
bucket_name = "my-dev-s3-bucket"
environment = "dev"
```

## 📜 License
This project is licensed under the MIT License.

---
🔹 **Author:** Babulal Tamang  
🔹 **Contact:** tamangsugam09@gmail.com


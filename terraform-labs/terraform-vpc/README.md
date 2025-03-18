## **📄 README for VPC & Subnets (`vpc/README.md`)**
```markdown
# 🌐 Terraform AWS VPC & Subnets

This Terraform module provisions an **AWS VPC with public and private subnets** for deploying applications securely.

## 📌 Features
- ✅ **Creates an AWS VPC**
- ✅ **Provisions multiple public & private subnets**
- ✅ **Sets up an Internet Gateway for public access**
- ✅ **Supports multiple availability zones for high availability**
- ✅ **Tagging enabled for better resource management**

## 📂 Project Structure
terraform-vpc/
│── main.tf          # Root module for VPC and subnets
│── variables.tf     # Input variables for VPC configuration
│── outputs.tf       # Output values
│── providers.tf     # AWS provider settings

## 🔧 **Prerequisites**
- Terraform v1.0+
- AWS CLI configured with credentials

## 🛠️ **Usage**
1️⃣ **Initialize Terraform**
```sh
terraform init
```

## 📤 Outputs
vpc_id → The ID of the created VPC
public_subnets → List of public subnet IDs
private_subnets → List of private subnet IDs

## 🔒 Security Considerations
🌍 Internet Gateway is attached only for public subnets.
🔒 Private subnets do not have direct internet access.
🚫 No public IPs assigned to private subnets.

📌 Destroying the VPC
To remove the VPC and subnets, run:
```sh
terraform destroy -auto-approve
```

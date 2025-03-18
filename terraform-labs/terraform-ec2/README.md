# 🚀 Terraform EC2 Instance Deployment  

This Terraform project provisions an **EC2 instance** in AWS using best practices, including modularization, security groups, and remote state storage.

## 📌 Features  
✅ **Modular Structure** – Separate modules for EC2 and Security Groups  
✅ **Scalable & Secure** – Easily extendable for multiple instances  
✅ **Remote State Support** – Store state files in S3 (optional)  
✅ **Best Practices** – Follows Terraform and AWS security guidelines  

---

## 📂 Project Structure  
terraform-ec2/
│── main.tf              # Root module
│── variables.tf         # Input variables
│── outputs.tf           # Output values
│── terraform.tfvars     # Variable values (optional, should be in .gitignore)
│── provider.tf          # AWS provider configuration
│── modules/
│   ├── ec2/
│   │   ├── main.tf      # EC2 resource definition
│   │   ├── variables.tf # EC2-specific variables
│   │   ├── outputs.tf   # EC2-specific outputs
│── versions.tf          # Required Terraform version
│── backend.tf           # Remote state storage (optional)
│── security-group.tf    # Security Group (optional)
│── README.md            # Documentation
│── .gitignore           # Ignore sensitive files


---

## 🏗 **Prerequisites**  
Ensure you have the following installed:  
🔹 **Terraform** (≥1.0.0) → [Install Terraform](https://developer.hashicorp.com/terraform/docs/install)  
🔹 **AWS CLI** → [Install AWS CLI](https://aws.amazon.com/cli/)  
🔹 **AWS Account** with IAM permissions  
🔹 **SSH Key Pair** in AWS  

### 🔑 Configure AWS Credentials  
Before running Terraform, configure AWS CLI:  
```sh
aws configure
```

## Initialize Terraform
```bash
terraform init
```

## Plan the Deployment
```bash
terraform plan
```

## Apply the Configuration
```bash
terraform apply -auto-approve
``

##  Retrieve the Public IP
```bash
terraform output instance_ip
```

## Use the IP to connect to your EC2 instance:
```bash
ssh -i your-key.pem ec2-user@<PUBLIC_IP>
```

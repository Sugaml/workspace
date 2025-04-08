# Terraform Labs

## Project structure
terraform/
│── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│── environments/
│   ├── dev/
│   │   ├── terragrunt.hcl
│   ├── prod/
│   │   ├── terragrunt.hcl
│── terragrunt.hcl
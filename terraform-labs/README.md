# Terraform Labs


### What if your state file if deleted?
==> Terraform loses track of infrastructure, leading to duplicates. Recovery needs manual imports or backups. Enable S3 versioning.

### How to refactor without downtime?
==> Use "terraform state mv" for renaming. Control changes with targeted applies and split into non-destructive PRs.

### What if a resource fails during apply?
==> Terraform creates a partial deployment. Use targeted applies and "--refresh-only" to recover.

### How to manage secrets?
==> Utilize external stores (Vault, AWS Secret Manager), ensure encryption, and mark outputs as sensative.

## Project structure
```structure
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
```
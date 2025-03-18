# Variables
ENV ?= dev
VARS_FILE = envs/$(ENV).tfvars

# Terraform Commands
init:
	terraform init

plan:
	terraform plan -var-file=$(VARS_FILE)

apply:
	terraform apply -var-file=$(VARS_FILE) -auto-approve

destroy:
	terraform destroy -var-file=$(VARS_FILE) -auto-approve

fmt:
	terraform fmt -recursive

validate:
	terraform validate

show:
	terraform show

output:
	terraform output

destroy:
	terraform destroy -var-file=envs/$(ENV).tfvars -auto-approve

clean:
	rm -rf .terraform terraform.tfstate* *.tfstate.backup

# Run all in one command
deploy: init plan apply

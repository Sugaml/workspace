# Variables
ENV ?= dev
VARS_FILE = envs/$(ENV).tfvars
PRIVATE_KEY = ../modules/ec2/sugam.pem
INSTANCE_IP = $(shell terraform output -raw instance_ip)

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

images:
	aws ec2 describe-images

ssh:
	@echo "Connecting to EC2 instance at ${INSTANCE_IP}..."
	@ssh -i ${PRIVATE_KEY} ec2-user@${INSTANCE_IP} "echo 'Connected to EC2 instance!'" 2>/dev/null

# Run all in one command
deploy: init plan apply

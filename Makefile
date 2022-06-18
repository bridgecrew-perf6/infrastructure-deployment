terraform-run: terraform-init terraform-plan terraform-apply

terraform-init:
	cd terraform && \
	terraform init -backend-config=backend-secret.tfvars && \
	cd -

terraform-plan:
	cd terraform && \
	terraform plan -var-file=secret.tfvars -var-file=backend-secret.tfvars && \
	cd -

terraform-apply:
	cd terraform && \
	terraform apply -var-file=secret.tfvars -var-file=backend-secret.tfvars && \
	cd -

terraform-destroy:
	cd terraform && \
	terraform destroy && \
	cd -

ansible-run:
	cd ansible && \
	ansible-playbook install-all.yml && \
	cd -

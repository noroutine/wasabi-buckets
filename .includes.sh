#!/bin/bash -eux

alias tfi="terraform init -backend-config=backend.conf"
alias tfp="terraform plan -var-file=secrets.tfvars -parallelism=1"
alias tfa="terraform apply -var-file=secrets.tfvars -parallelism=1"
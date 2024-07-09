#!/bin/bash

# Get Terraform output values
DB_HOST=$(terraform output -raw db_instance_private_ip)
DB_USER=$(terraform output -raw db_user)
DB_PASSWORD=$(terraform output -raw db_password)

# Create Kubernetes secret
kubectl create secret generic db-credentials \
  --from-literal=db_host=$DB_HOST \
  --from-literal=db_user=$DB_USER \
  --from-literal=db_password=$DB_PASSWORD

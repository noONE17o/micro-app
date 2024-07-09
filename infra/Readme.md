*Terraform Best Practices*

Modular Structure: Use modules to encapsulate related resources. This helps in reusability and better organization.

Variables and Outputs: Use variables for inputs and outputs for important resource identifiers.

State Management: Ensure you have a remote backend for storing Terraform state securely.

Documentation: Include documentation in your Terraform files for clarity.

DIRECTORY ARCHITECTURE:

- infra/modules/gke: Module for creating the GKE cluster.
- infra/modules/monitoring: Module for setting up monitoring.
- infra/modules/network: Module for creating VPC and subnets.
- infra/modules/sql: Module for creating the SQL instance.
- infra/modules/Service-Accounts: Module for creating service accounts.
# authenticatio bld
Both parts work together: The first part authenticates gcloud with Google Cloud using a service account, and the second part configures Docker to use these credentials to interact with GCR.
Sequence: Authenticate gcloud first, then configure Docker to use gcloud credentials.
Advantages: This approach ensures secure and seamless access to both Google Cloud services and GCR, enabling automated deployments and image management.
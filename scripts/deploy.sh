#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Variables
PROJECT_ID="your-project-id"
FRONTEND_IMAGE_NAME="angular-app"
BACKEND_IMAGE_NAME="spring-app"
TAG="latest"
FRONTEND_IMAGE="gcr.io/$PROJECT_ID/$FRONTEND_IMAGE_NAME:$TAG"
BACKEND_IMAGE="gcr.io/$PROJECT_ID/$BACKEND_IMAGE_NAME:$TAG"

# Authenticate with Google Cloud using service account
if [[ -z "${GOOGLE_APPLICATION_CREDENTIALS}" ]]; then
  echo "Environment variable GOOGLE_APPLICATION_CREDENTIALS is not set. Exiting."
  exit 1
fi

echo "Authenticating with Google Cloud..."
gcloud auth activate-service-account --key-file="${GOOGLE_APPLICATION_CREDENTIALS}"

# Authenticate Docker with GCR
echo "Authenticating Docker with GCR..."
gcloud auth configure-docker

# Push Angular frontend Docker image to GCR
echo "Pushing Angular frontend Docker image to GCR..."
docker push $FRONTEND_IMAGE

# Push Spring Boot backend Docker image to GCR
echo "Pushing Spring Boot backend Docker image to GCR..."
docker push $BACKEND_IMAGE

echo "Docker images pushed to GCR successfully!"
echo "Frontend Image: $FRONTEND_IMAGE"
echo "Backend Image: $BACKEND_IMAGE"

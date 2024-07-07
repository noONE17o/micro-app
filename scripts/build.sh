#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Variables
PROJECT_ID="my-project-mic-428213"
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

#echo "Authenticating with Google Cloud..."
gcloud auth activate-service-account --key-file="${GOOGLE_APPLICATION_CREDENTIALS}"

# Authenticate Docker with GCR
echo "Authenticating Docker with GCR..."
gcloud auth configure-docker

# Build Angular frontend Docker image
echo "Building Angular frontend Docker image..."
cd ../path/to/angular-app
docker build -t $FRONTEND_IMAGE .
cd -

# Build Spring Boot backend Docker image
echo "Building Spring Boot backend Docker image..."
cd ../path/to/spring-boot-app
docker build -t $BACKEND_IMAGE .
cd -

echo "Docker images built successfully!"
echo "Frontend Image: $FRONTEND_IMAGE"
echo "Backend Image: $BACKEND_IMAGE"

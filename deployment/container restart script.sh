#!/bin/bash

# Docker Hub credentials this being what is used to login to Dockerhub
DOCKER_USERNAME="your_username"
DOCKER_PASSWORD="your_password"

# Details of the Dockerhub container and image, specifically the one pushed from our GitHub repo to Dockerhub
CONTAINER_NAME="your_container_name"
IMAGE_NAME="your_username/your_image_name:latest"

# Command to log in to the Docker Hub account
docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"

# Command to pull the latest image from within the Dockerhub public repo
docker pull "$IMAGE_NAME"

# Command to stop and remove the existing container
docker stop "$CONTAINER_NAME" && docker rm "$CONTAINER_NAME"

# Command to run the Dockerhub container with the new image after the restart
docker run -d --name "$CONTAINER_NAME" -p 80:80 "$IMAGE_NAME"

#Command to make the exript executable
#chmod +x update_and_restart.sh

#Remember to replace Docker_Username and Docker_Password with your details to log into your DockerHub account

#The container name is Docker Image CI/CD

#The Image name is my-project-repository:v4.0.0

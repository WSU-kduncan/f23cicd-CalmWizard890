**Part 1**

**CI Project Overview**

For this project, I am showing my knowledge on continuous integration, by using Docker and creating a Dockerfile to host the image of my custom website, and then using markdown documentation showing the steps necessary to recreate my project locally. In the next part I use the resource Dockerhub to push my previously created image into it and use CI to authenticate into Dockerhub. Next, I configure Github Secrets to house my Dockerhub Username and Password, and lastly configure a GitHub action workflow to automatically build and push docker images to Dockerhub. In the final part I create a diagram going over the whole process of continuous integration and the tools I used to connect the different parts of the process.

As for why I am doing this project, it is to show my understanding on the subject of continuous integration and the tools related to it. And to better understand the steps that go into the different tools of continuous integration and how each one has it advantages and disadvantages.

The tools I used in this project are:
1. Docker Software
2. Dockerfile
3. Dockerhub website
4. GitHub Action workflow

**How to Run Project Locally**

_How to install Docker on WSL2_
1. sudo apt update
2. sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
3. curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
4. sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
5. apt-cache policy docker-ce
6. sudo apt install docker-ce -y
7. sudo snap install docker
8. sudo systemctl status docker

_How to build an image from the Dockerfile_
1. FROM httpd:2.4
2. MAINTAINER MaximusWilliams
3. RUN apt update
4. COPY ./Project4/website/index.html /usr/local/apache2/htdocs/
5. EXPOSE 80
6. CMD [“apachectl”, “-D”, "FOREGROUND]

_How to run the container_
1. Run the command "docker build -t my-website ." to create your image from the Dockerfile.
2. Run the command "docker run -dp 71.64.191.192:80:80 my-website" to deploy the container in detached mode (d) and to map port tcp 80 to a free port on your home system (p) followed by your own home ip address and the port number to tell where to put the website on your homes ip address.
3. Run the command "docker ps" to see all listed container that are running, you should see the container you named.

_How to view the project running in the container_
1. Open up browser of choice (mine is Google Chrome).
2. Go to the address bar and type in "https://localhost:80" to go to the correct location.
3. Opens into the apache2 webserver containing your website.


**Part 2**

_How to create a public repository in Dockerhub_
1. Go to [DockerHub offical site](https://hub.docker.com/)
2. Click Sign In.
3. Enter yuor DockerHub Username and Password.
4. On your homepage click the Create repository button.
5. Create a name for your repository, a description of it, and click Public viewability.
6. Click Create and it should appear in your list of repositories.

_How to authenciate with Dockerhub usign command-line interface_
- Credentials needed are your DockerHub username and password that you put into your GitHub secrets.
- docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

_How to push images to Dockerhub w/o GitHub Actions_
- docker push ${{secrets.DOCKER_USERNAME}}/my-project-repository:tagname

_DockerHub Repo Link_
- [My Public DockerHub Repository](https://hub.docker.com/repository/docker/calmwizard890/my-project-repository/general)

_GitHub Secrets Configuration_
- **How to set up a secret**
1. Go to your GutHub Repository
2. On to top of the page click the Settings button
3. Under the security section click Secrets and variables and then the actions tab
4. Make sure the tab is on secrets and not variables
5. Click on New Repository secret
6. Name your secret and set its whatever the secret is.
7. Click Add Secret
8. Repeat steps 5-7 for all other secrets you need to add.

- **What secrets are within this project**
1. My DockerHub Username
2. My Dockerhub Password

_Beahvior of GitHub workflow_
- What does it do
1. A GitHub workflow is a customizable automated process that will run one or more jobs.
- When does a Github Workflow activate
1. The workflow will run when:
   - Triggered by an event in the repository that you write into the workflow ie.(A Git branch or tag is created in the workflows repository).
   - Triggered manually.
       1. Under repository name click Actions.
       2. In the sidebar to the left click the name of the workflow.
       3. Above the list of runs done by the workflow click run button to manually run the workflow.
   - Triggered on a defined schedule within the workflow ie.(5:30 UTC every Monday-Thursday).
- What variables are custom to my project
  - Docker Username
  - Docker Password
  - DockerHub public respository name
  - File name for the docker build command being Project4/Dockerfile

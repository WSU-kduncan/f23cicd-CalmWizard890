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
3. RUN apt update && /
4. RUN apt install -y python3 && /
5. RUN apt update python3 && /
6. RUN apt install -y python-pip3 && /
7. RUN apt update python-pip3 && /
8. COPY ./Project4/website /usr/local/apache2/htdocs/
9. EXPOSE 80
10. CMD [“/Project4/website”, “-D”]

_How to run the container_
1. Run the command "docker build -t my-website" to create your image from the Dockerfile.
2. Run the command "docker run -dp 71.64.191.192:80:80 my-website" to run the container.
2. Run the command "docker ps" to see all listed container that are running, you should see the container you named.

_How to view the project running in the container_
1. Open up browser of choice (mine is Google Chrome).
2. Go to the address bar and type in "https://localhost:80" to go to the correct location.
3. Opens into the apache2 webserver containing your website.


**Part 2**

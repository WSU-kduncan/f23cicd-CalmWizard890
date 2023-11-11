**-Part 1-**

**CI Project Overview**

(what are you doing, why, what tools)


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

#Tells the builder to use apache2 as the base image.
1. FROM httpd:2.4

#Tells who owns and maintains the file.
2. MAINTAINER MaximusWilliams

#Updates all packages and installs python/pip 3 for good measure
3. RUN apt update && /
4. RUN apt install -y python3 && /
5. RUN apt update python3 && /
6. RUN apt install -y python-pip3 && /
7. RUN apt update python-pip3 && /

#Copies new files or directories from our specified source, and adds them to the new filesystem.
6.COPY ./Project4/website /usr/local/apache2/htdocs/

#Tells what open to open up.
7.EXPOSE 80

#Tells what commands to be able to use this dockerfile set of instructions easier
8. CMD [“/Project4/website”, “-D”]

_How to run the container_
1. Run the command "docker build -t my-website" to create your image from the Dockerfile.
2. Run the command "docker run -dp 71.64.191.192:80:80 my-website" to run the container.
2. Run the command "docker ps" to see all listed container that are running and you should see the container you named.

_How to view the project running in the container_
1. Open up browser of choice (mine is Google Chrome still)
2. Go to the address bar and type in "https://localhost:80"
3. Opens into the apache2 webserver that houses your created website (mine is named my-website)

**Part 2**

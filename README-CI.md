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
1. FROM apache2:latest
2. MAINTAINER MaximusWilliams
3. RUN apt update && /
4. RUN apt install -y python3 && /
5. RUN apt update python3 && /
6. RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
7. COPY . /Project4/website
8. EXPOSE 80
9. CMD [“/Project4/website/index.html”, “-D”]

_How to run the container_
1. Run the command "docker run -dp 71.64.191.192:80:80 index.html" to run the container.
2. Run the command "docker ps" to see all listed container that are running and you should see the container you named.

_How to view the project running in the container_
1. Open up browser of choice (mine is chrome still)
2. Go to the address part and type in "https://localhost:8080"
3. Opens into apache2 webserver that house your website (mine is named index.html)

**Part 2**

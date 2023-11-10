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
1. FROM ubuntu:22.04
2. MAINTAINER MaximusWilliams
3. RUN apt update
4. RUN apt install -y apache2
5. RUN apt install -y apache2-utils
6. RUN apt clean
7. COPY index.html /var/www/html
8. EXPOSE 80
9. CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]

_How to run the container_


_How to view the project running in the container_



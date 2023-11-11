#Install Docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo snap install docker
sudo systemctl status docker




FROM ubuntu:22.04
MAINTAINER MaximusWilliams
RUN apt update
RUN apt install -y apache2
RUN apt install -y apache2-utils
RUN apt clean
COPY index.html /var/www/html
EXPOSE 80
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]

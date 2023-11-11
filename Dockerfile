FROM ubuntu:22.04
MAINTAINER MaximusWilliams
RUN apt update
RUN apt install -y apache2
RUN apt install -y apache2-utils
RUN apt clean
COPY index.html /var/www/html
EXPOSE 80
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]

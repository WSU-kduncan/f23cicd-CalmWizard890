FROM apache2:latest

MAINTAINER MaximusWilliams

RUN apt update && /
RUN apt install -y python3 && /
RUN apt update python3 && /
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY . /Project4/website

EXPOSE 80

CMD [“/Project4/website/index.html”, “-D”]

#docker run -dit -p 80:80 -v /home/accellinux/website:/usr/local/apache2/htdocs/ apache2:latest

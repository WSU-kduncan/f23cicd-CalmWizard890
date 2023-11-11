FROM httpd:2.4

MAINTAINER MaximusWilliams

RUN apt update && /
RUN apt install -y python3 && /
RUN apt update python3 && /

COPY ./Project4/website /usr/local/apache2/htdocs/

EXPOSE 80

CMD [“/Project4/website”, “-D”]

#docker run -dit -p 80:80 -v /home/accellinux/website:/usr/local/apache2/htdocs/ httpd:2.4

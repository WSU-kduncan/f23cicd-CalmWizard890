#Tells the builder to use apache2 as the base image.
FROM httpd:2.4
#Tells who owns and maintains the file.
MAINTAINER MaximusWilliams
#Updates all packages
RUN apt update
#Copies new files or directories from our specified source, and adds them to the new filesystem.
COPY ./website/index.html /usr/local/apache2/htdocs/
#Tells what port to open up.
EXPOSE 80

#docker run -dit -p 80:80 -v /home/accellinux/website:/usr/local/apache2/htdocs/ httpd:2.4

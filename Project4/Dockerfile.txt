#Tells the builder to use apache2 as the base image.
FROM httpd:2.4
#Tells who owns and maintains the file.
MAINTAINER MaximusWilliams
#Updates all packages and installs python/pip 3 for good measure
RUN apt update && /
RUN apt install -y python3 && /
RUN apt update python3 && /
RUN apt install -y python-pip3 && /
RUN apt update python-pip3 && /
#Copies new files or directories from our specified source, and adds them to the new filesystem.
COPY ./Project4/website /usr/local/apache2/htdocs/
#Tells what port to open up.
EXPOSE 80
#Tells what commands to be able to use this dockerfile set of instructions easier.
CMD [“/Project4/website”, “-D”]

#docker run -dit -p 80:80 -v /home/accellinux/website:/usr/local/apache2/htdocs/ httpd:2.4

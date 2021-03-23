FROM ubuntu:16.04

MAINTAINER RaviKiran

# Install dependencies
RUN apt-get update -y && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*

# After the Installation of apache and write hello world message to the index.html file here it can be any applications details
RUN echo "Hello World!" > /var/www/html/index.html

# Configure apache
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www

#Set Environment Variables
ENV APACHE_RUN_USER  www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR   /var/log/apache2
ENV APACHE_PID_FILE  /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR   /var/run/apache2
ENV APACHE_LOCK_DIR  /var/lock/apache2
ENV APACHE_LOG_DIR   /var/log/apache2


#Create directories
RUN mkdir -p $APACHE_RUN_DIR
RUN mkdir -p $APACHE_LOCK_DIR
RUN mkdir -p $APACHE_LOG_DIR
RUN mkdir -p /root/mydir

# Usage: When i login i directly goes to that working directory and runs all my commands from here
WORKDIR /root/mydir

# ADD Copying the Files from my local server to Docker Image
#ADD /myfile /root/mydir/


#Expose the Container port to 80
EXPOSE 80


# Start the Apache2 service in the back ground
# CMD ["sed", "-n", "74p", "/etc/apache2/apache2.conf"]
# CMD ["cat", "/etc/apache2/envvars"]
CMD /usr/sbin/apache2ctl -D FOREGROUND



Esc:wq!

Build the container image: now we are building a new image with the changes given in the docker file

docker build -t aws-ecr-hello-world:v0.9.1 .

Run the container:

docker run -it -d -p 8080:80 --name=mycontainer test

docker exec -it containid /bin/bash

docker container run -d —name container-name -p 8080:8080 imagename

here 8080 is the container port number
80 is the host port number it means what ever the traffic comes to 80 divert to 8080

Or

docker build -t tag https://github.com/honeysundar/java_application.git



Login to the apache2

http://ec2-34-209-212-58.us-west-2.compute.amazonaws.com:8080


Example For Nginx

FROM ubuntu:16.04
  
MAINTAINER RaviKiran

# Install dependencies
RUN apt-get update -y && apt-get install -y nginx

# Usage: When i login i directly goes to that working directory and runs all my commands from here
WORKDIR /var/www/html/


#RUN
RUN rm -rf /var/www/html/*

# ADD Copying the Files from my local server to nginx server
ADD index.html /var/www/html/index.html

#Expose the Container port to 80
EXPOSE 80

#First command to run when the container is started
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]


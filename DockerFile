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

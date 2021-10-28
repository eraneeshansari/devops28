FROM ubuntu:18.04
RUN apt update && apt install apache2 -y 
ADD web.tar.gz /var/www/html
EXPOSE 80
WORKDIR /var/www/html
ENTRYPOINT ["/usr/sbin/apache2ctl","-D","FOREGROUND"]

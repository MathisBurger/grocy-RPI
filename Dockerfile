FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

WORKDIR /var/www/html
RUN apt update
RUN apt install wget -y
RUN apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
RUN add-apt-repository ppa:ondrej/php
RUN apt update -y
RUN apt install apache2 -y
RUN apt install unzip
RUN apt install php8.1-common php8.1-cli php8.1-xml php8.1-curl php8.1-zip php8.1-gd php8.1-fileinfo php8.1-intl php8.1-mbstring -y
RUN apt-get install php8.1-sqlite -y
RUN apt install libapache2-mod-php8.1 -y
RUN wget https://github.com/grocy/grocy/releases/download/v4.0.0/grocy_4.0.0.zip
RUN unzip grocy_4.0.0.zip
COPY config-dist.php config-dist.php
COPY config-dist.php data/config.php
RUN chown -R www-data:www-data /var/www/html
COPY config.conf /etc/apache2/sites-enabled/000-default.conf
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN apt install apache2-utils -y
RUN apt clean 
EXPOSE 80

FROM balenalib/raspberry-pi-debian:latest
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

WORKDIR /var/www/html
RUN apt update -y
RUN apt install wget -y
RUN apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
RUN wget -qO /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt update -y
RUN apt install apache2 -y
RUN apt install unzip
RUN apt-get upgrade -y
RUN apt install -y php8.1-common php8.1-cli php8.1-xml php8.1-curl php8.1-zip php8.1-gd
RUN apt install -y php8.1-fileinfo php8.1-intl php8.1-mbstring
RUN apt-get install php8.1-sqlite -y
RUN apt install -y libapache2-mod-php8.1
RUN wget https://github.com/grocy/grocy/releases/download/v4.0.0/grocy_4.0.0.zip
RUN unzip grocy_4.0.0.zip
COPY config-dist.php config-dist.php
COPY config-dist.php data/config.php
RUN chown -R www-data:www-data /var/www/html
COPY config.conf /etc/apache2/sites-enabled/000-default.conf

ENTRYPOINT service apache2 restart

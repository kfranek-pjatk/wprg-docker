FROM ubuntu:20.04

MAINTAINER Krzysztof Franek <kfranek@pjwstk.edu.pl>

# Initial needs
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Warsaw
RUN apt-get -y update && apt-get install -y software-properties-common curl git unzip zip acl sqlite3 \
    python pip

# Localcoding
RUN apt-get install locales
RUN locale-gen en_US.UTF-8 && export LANG=en_US.UTF-8
RUN touch /etc/default/locale && echo LANG="en_US.UTF-8" > /etc/default/locale && echo LANGUAGE="en_US:en" >> /etc/default/locale 

# install php8.0 from ondrej repository
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php \
    && apt-get -y update \
    && apt-get -y install php8.0 \
    # php extensions
    && apt-get install -y php8.0-xml php8.0-mbstring php8.0-mysql php8.0-pgsql \
    	    php8.0-curl php8.0-sqlite php8.0-redis php8.0-mongodb php8.0-xdebug php8.0-ldap \
    	    php8.0-gd php8.0-amqp

COPY php.ini /usr/local/etc/php/

# remove unnecessary packages
RUN apt-get -y remove --purge software-properties-common

# composer install
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN adduser docker

ENV APACHE_RUN_USER docker
ENV APACHE_RUN_GROUP docker
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid

# install apache
RUN apt-get -y update && apt-get install -y apache2 libapache2-mod-php8.0 && a2enmod rewrite

## Update the default apache site with the config we created.
ADD apache.conf /etc/apache2/sites-enabled/000-default.conf

COPY apache2-foreground /usr/local/bin/
RUN chmod +x /usr/local/bin/apache2-foreground

VOLUME /var/www/html

## Set Symfony as dev
ENV SYMFONY_ENV dev

ENV AM_I_WPRG_DOCKER 1

EXPOSE 80

WORKDIR /var/www/html

## Run Apache2 in foreground
CMD apache2-foreground

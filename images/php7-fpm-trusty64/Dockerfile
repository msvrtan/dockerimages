FROM ubuntu:trusty

ENV LANG C.UTF-8

#
##### Setup using PPA's #####
#

RUN apt-key update \
  && apt-get update \
  && apt-get install -y software-properties-common python-software-properties

#
##### Setup PHP7 #####
#

RUN add-apt-repository -y ppa:ondrej/php

RUN apt-get update && \
    apt-get install -y \
      wget \
      mysql-client \
      php7.0-cli \
      php7.0-curl \
      php7.0-fpm \
      php7.0-gd \
      php7.0-intl \
      php7.0-json \
      php7.0-mbstring \
      php7.0-mcrypt \
      php7.0-mysql \
      php7.0-opcache \
      php7.0-xml \
      php-apc \
      php-memcached \
      php-imagick \
      php-zip \
      php-redis 

RUN mkdir -p /run/php/

COPY configs/php-fpm/php-fpm.conf  /etc/php/7.0/fpm/php-fpm.conf
COPY configs/php-fpm/pool.d/www.conf  /etc/php/7.0/fpm/pool.d/www.conf

#
##### Setup supervisor #####
#

RUN apt-get install -y supervisor

RUN mkdir -p /var/log/supervisor
COPY configs/supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/var/www", "/etc/php"]

EXPOSE 7777
CMD ["/usr/bin/supervisord"]

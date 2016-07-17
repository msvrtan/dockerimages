FROM ubuntu:trusty

ENV LANG C.UTF-8

#
##### Setup using PPA's #####
#

RUN apt-key update \
  && apt-get update \
  && apt-get install -y software-properties-common python-software-properties

#
##### Setup nginx #####
#

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 8B3981E7A6852F782CC4951600A6F0A3C300EE8C \
  && add-apt-repository -y ppa:nginx/stable \
  && apt-get update \
  && apt-get install -y ca-certificates nginx gettext-base


COPY configs/nginx/sites-enabled/localhost.conf /etc/nginx/sites-enabled/localhost.conf
COPY configs/nginx/sites-enabled/test.conf /etc/nginx/sites-enabled/test.conf
COPY configs/nginx/ssl/localhost.crt  /etc/nginx/ssl/localhost.crt
COPY configs/nginx/ssl/localhost.key  /etc/nginx/ssl/localhost.key
COPY configs/nginx/ssl/test.crt  /etc/nginx/ssl/test.crt
COPY configs/nginx/ssl/test.key  /etc/nginx/ssl/test.key

#Setup supervisor

RUN apt-get install -y supervisor

RUN mkdir -p /var/log/supervisor
COPY configs/supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

#
##### To be honest,not sure if I should merge this to nginx part? #####
#

VOLUME ["/var/www", "/etc/nginx"]

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
CMD ["/usr/bin/supervisord"]

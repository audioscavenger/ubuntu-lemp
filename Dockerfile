ARG TAG=latest
FROM ubuntu:${TAG:-latest}

LABEL maintainer="audioscavenger <dev@derewonko.com>" \
  org.label-schema.name="Ubuntu-LEMP" \
  org.label-schema.vendor="lesmoules" \
  org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update -y && \
apt-get upgrade -y && \
apt-get install -y \
apt-utils \
apt-transport-https \
iputils-ping \
bzip2 \
unzip \
ca-certificates \
bash \
nvi \
curl \
wget \
procps \
cron && \
apt-get clean && \
/bin/ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime


RUN apt-get install -y \
git-core \
patch \
sshpass \
openssl \
smbclient \
mysql-client \
postgresql-client \
sqlite && \
apt-get clean


RUN apt-get install -y \
nginx-extras \
geoip-database \
libgeoip1 \
php-apcu \
php-fpm \
php-gd \
php-json \
php-mysql \
php-sqlite3 \
php-pgsql \
php-curl \
php-intl \
php-imagick \
php-zip \
php-xml \
php-mbstring \
php-soap \
php-ldap \
php-apcu \
php-redis \
php-smbclient \
/bin/ln -sf /etc/environment /etc/default/php-fpm7.2 && \
apt-get clean && \
apt -y autoremove && \
apt -y autoclean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/mnt/data"]
ADD rootfs /
CMD ["sleep", "999"]

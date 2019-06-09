## https://docs.docker.com/engine/reference/builder/
ARG UBUNTU_VERSION=latest
FROM ubuntu:${UBUNTU_VERSION}
ARG UBUNTU_VERSION

ENV UBUNTU_VERSION=${UBUNTU_VERSION:-latest} \
    PHP_VERSION=7.2 \
    DOCKERIZE_VERSION=v0.6.1 \
    GOMPLATE_VERSION=v3.5.0 \
    SUEXEC_VERSION="1.11" \
    TERM=xterm \
    TZ=America/New_York \
    LANG=C

LABEL maintainer="audioscavenger <dev@derewonko.com>" \
  org.label-schema.name="Ubuntu-LEMP" \
  org.label-schema.vendor="lesmoules" \
  org.label-schema.schema-version="1.0"


RUN DEBIAN_FRONTEND=noninteractive apt-get update -yq \
&& apt-get install -yq --no-install-recommends \
apt-utils \
&& apt-get -yq clean \
&& /bin/ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime


RUN DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -yq \
&& apt-get install -yq --no-install-recommends \
apt-transport-https \
iputils-ping \
bzip2 \
unzip \
software-properties-common \
net-tools \
ca-certificates \
bash \
nvi \
curl \
wget \
procps \
cron \
sudo \
git-core \
patch \
gpgv \
sshpass \
openssl \
ssl-cert \
smbclient \
mysql-client \
postgresql-client \
geoip-database \
libgeoip1 \
sqlite \
&& apt-get -yq clean


RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
nginx-extras \
php${PHP_VERSION} \
php-apcu \
php-cli \
php-common \
php-curl \
php-fpm \
php-gd \
php-imagick \
php-intl \
php-json \
php-ldap \
php-mbstring \
php-mysql \
php-opcache \
php-pgsql \
php-phpdbg \
php-readline \
php-redis \
php-smbclient \
php-soap \
php-sqlite3 \
php-xml \
php-zip \
&& apt-get -yq clean \
&& apt-get -yq autoremove \
&& apt-get -yq autoclean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/mnt/data"]

# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
# ADD rootfs /
COPY rootfs/ /

# wait-for-it Use this script to test if a given TCP host/port are available
ADD https://raw.githubusercontent.com/audioscavenger/wait-for-it/master/wait-for-it.sh /usr/bin/wait-for-it

# dockerize Utility to simplify running applications in docker containers
ADD https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz /tmp/dockerize-linux-amd64.tar.gz

# gomplate Process text files with Go templates
ADD https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-amd64-slim /usr/bin/gomplate

# su-exec is a very minimal re-write of gosu in C, making for a much smaller binary; however we actually install gosu because we are too lazy to compile su-exec
ADD https://github.com/tianon/gosu/releases/download/${SUEXEC_VERSION}/gosu-amd64 /usr/bin/su-exec

# post-config & optimizations
RUN tar -C /usr/bin -xzvf /tmp/dockerize-linux-amd64.tar.gz \
&& rm /tmp/dockerize-linux-amd64.tar.gz \
&& /bin/chmod 755 /usr/bin/gomplate /usr/bin/wait-for-it /usr/bin/dockerize /usr/bin/su-exec /root/.bashrc /etc/bash.bashrc /etc/inputrc \
&& /bin/ln -sf /etc/environment /etc/default/php-fpm7.2

# sleeping 15mn just to be able to connect is useless, use the attach command:
# sudo docker attach ubuntu-lemp
# sudo docker exec -i -t ubuntu-lemp /bin/bash
# CMD ["sleep", "999"]

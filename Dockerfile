ARG TAG=latest
FROM ubuntu:${TAG:-latest}

LABEL maintainer="audioscavenger <dev@derewonko.com>" \
  org.label-schema.name="Ubuntu-LEMP" \
  org.label-schema.vendor="lesmoules" \
  org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
ENV DOCKERIZE_VERSION v0.6.1
ENV TZ=America/New_York

RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install -y \
apt-utils \
apt-transport-https \
iputils-ping \
bzip2 \
unzip \
&& apt-get clean \
&& /bin/ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime


RUN apt-get install -y \
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
smbclient \
mysql-client \
postgresql-client \
sqlite \
&& apt-get clean


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
&& /bin/ln -sf /etc/environment /etc/default/php-fpm7.2 \
&& apt-get clean \
&& apt -y autoremove \
&& apt -y autoclean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


VOLUME ["/mnt/data"]
ADD rootfs /

# wait-for-it Use this script to test if a given TCP host/port are available
ADD https://raw.githubusercontent.com/audioscavenger/wait-for-it/master/wait-for-it.sh /usr/bin/wait-for-it

# dockerize Utility to simplify running applications in docker containers
ADD https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz /tmp/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz

# gomplate Process text files with Go templates
ADD https://github.com/hairyhenderson/gomplate/releases/download/v3.1.0/gomplate_linux-amd64-slim /usr/bin/gomplate

# su-exec is a very minimal re-write of gosu in C, making for a much smaller binary; however we actually install gosu because we are too lazy to compile su-exec
ADD https://github.com/tianon/gosu/releases/download/1.11/gosu-amd64 /usr/bin/su-exec

RUN tar -C /usr/bin -xzvf /tmp/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
&& rm /tmp/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
&& /bin/chmod 755 /usr/bin/gomplate /usr/bin/wait-for-it /usr/bin/dockerize /usr/bin/su-exec /root/.bashrc /etc/bash.bashrc /etc/inputrc

# sleeping 15mn just to be able to connect is useless, use the attach command:
# sudo docker attach ubuntu-lemp
# sudo docker exec -i -t ubuntu-lemp /bin/bash
# CMD ["sleep", "999"]

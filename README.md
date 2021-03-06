# ownCloud: Ubuntu-LEMP

[![Build Status](https://drone.owncloud.com/api/badges/owncloud-docker/ubuntu/status.svg)](https://drone.owncloud.com/owncloud-docker/ubuntu)
[![](https://images.microbadger.com/badges/image/owncloud/ubuntu:latest.svg)](https://microbadger.com/images/owncloud/ubuntu:latest "Get your own image badge on microbadger.com")

This is a minimal (520MB) customized [Ubuntu](http://www.ubuntu.com/) base image based on [official Ubuntu](https://registry.hub.docker.com/_/ubuntu/) latest + Nginx-extras + PHP7.2-FPM. It's used as a Docker image base for other projects.


## Versions

To get an overview about the available versions please take a look at the [GitHub branches](https://github.com/audioscavenger/ubuntu-lemp/branches/all) or our [Docker Hub tags](https://cloud.docker.com/repository/docker/audioscavenger/ubuntu-lemp/tags), these lists are always up to date.

# Features

## Optimized
- build speed
- build size: 520MB

## Content
- BASE docker/ubuntu <-- ubuntu:18.04
- nginx-extras 1.14
- php7.2-fpm (128MB default)
- APCu (1MB shm size default)
- tools
- much more

## Volumes

* VOLUME ["/mnt/data"]


## Ports

* None


# Built
:TAG == UBUNTU_VERSION

## build latest
```
git clone https://github.com/audioscavenger/owncloud-lemp
cd owncloud-lemp
docker build .
```

## build with Specific versions
* Example 1: build with custom tag _test-rc1_ using GOMPLATE_VERSION _v3.1.0_:
```
docker build -e GOMPLATE_VERSION=v3.1.0 -t owncloud-lemp:test-rc1 .
```

* Example 2: build with custom tag _19.04-7.3_ using a different version FROM ubuntu _19.x_ and PHP:
```
docker build --build-arg UBUNTU_VERSION=19.04 -e PHP_VERSION=7.3 -t owncloud-lemp:19.04-7.3 .
```

## Build Environment Variables
```
ARG UBUNTU_VERSION=latest

ENV PHP_VERSION 7.2
ENV DOCKERIZE_VERSION v0.6.1
ENV GOMPLATE_VERSION v3.5.0
ENV SUEXEC_VERSION "1.11"

ENV TERM xterm
ENV TZ America/New_York
ENV LANG C
```


## Issues, Feedback and Ideas

Open an [Issue](https://github.com/audioscavenger/ubuntu-lemp/issues)


## Contributing

Fork -> Patch -> Push -> Pull Request


## Forked from: Authors

* [Thomas Boerger](https://github.com/tboerger)
* [Felix Boehm](https://github.com/felixboehm)

# Notes

## Todo List

- [x] ENV PHP_VERSION
- [x] ENV DOCKERIZE_VERSION
- [x] ENV GOMPLATE_VERSION
- [x] ENV SUEXEC_VERSION
- [x] move DEBIAN_FRONTEND=noninteractive in RUN
- [x] use apt-get only to avoid useless terminal warnings


## License

GNU v3.0


## Copyright

```
Copyright (c) 2019 Eric Derewonko <dev@derewonko.com>
```

## Dependencies

See dockerfile for more details

* docker image ubuntu:latest
* jwilder/dockerize v0.6.1
* hairyhenderson/gomplate v3.5.0
* tianon/gosu 1.11
* audioscavenger/wait-for-it latest

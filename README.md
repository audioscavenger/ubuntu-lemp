# ownCloud: Ubuntu-LEMP

[![Build Status](https://drone.owncloud.com/api/badges/owncloud-docker/ubuntu/status.svg)](https://drone.owncloud.com/owncloud-docker/ubuntu)
[![](https://images.microbadger.com/badges/image/owncloud/ubuntu:latest.svg)](https://microbadger.com/images/owncloud/ubuntu:latest "Get your own image badge on microbadger.com")

This is our minimal customized [Ubuntu](http://www.ubuntu.com/) base image based on [official Ubuntu](https://registry.hub.docker.com/_/ubuntu/). It's used for most of our Docker images.


## Versions

To get an overview about the available versions please take a look at the [GitHub branches](https://github.com/owncloud-docker/ubuntu/branches/all) or our [Docker Hub tags](https://hub.docker.com/r/owncloud/ubuntu/tags/), these lists are always up to date.


## Volumes

* VOLUME ["/mnt/data"]


## Ports

* None


## Available environment variables

```
ARG TAG=latest
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm
```


## Issues, Feedback and Ideas

Open an [Issue](https://github.com/owncloud-docker/ubuntu/issues)


## Contributing

Fork -> Patch -> Push -> Pull Request


## Forked from: Authors

* [Thomas Boerger](https://github.com/tboerger)
* [Felix Boehm](https://github.com/felixboehm)


## License

GNU v3.0


## Copyright

```
Copyright (c) 2019 Eric Derewonko <dev@derewonko.com>
```

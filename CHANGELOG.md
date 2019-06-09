# Changelog

## 2019-06-09

* Changed
  * use ENV for version downloads
  * created ARG UBUNTU_VERSION=latest
  * ENV PHP_VERSION for scripting automation
  * use apt-get only to avoid useless terminal warnings
  * rearranged RUN commands order and content for optimized install speed
* Removed
  * move DEBIAN_FRONTEND=noninteractive in RUN

## 2018-10-08

* Changed
  * Download additional tools within drone
* Removed
  * Dropped shell script for tool download

## 2018-09-25

* Added
  * Install sshpass for SSH agent
* Changed
  * Upgrade to 18.04 LTS as base image
  * Upgrade dockerize from v0.4.0 to v0.6.1
  * Trigger `owncloud-docker/php` downstream
  * Trigger `owncloud-ci/client` downstream
  * Limit downstream to `master` branch
* Removed
  * Drop `owncloud-docker/base` downstream

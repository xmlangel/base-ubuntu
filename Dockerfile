FROM ubuntu:14.04

MAINTAINER Kwangmyung Kim <kwangmyung.kim@gmail.com>

# Set locales
RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_CTYPE en_GB.UTF-8

# Set Korea source.list
RUN sed -i 's/archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
RUN sed -i 's/security.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list

# Fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install dependencies
RUN apt-get update && \
apt-get install -y git build-essential curl wget software-properties-common vim screen

ENTRYPOINT cron && rsyslogd && bash

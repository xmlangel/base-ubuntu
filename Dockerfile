FROM ubuntu:12.04

MAINTAINER Kwangmyung Kim <kwangmyung.kim@gmail.com>

# Set locales
RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_CTYPE en_GB.UTF-8

#Set Korea source.list
RUN sed -i 's/archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
RUN sed -i 's/security.archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list

# Fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install dependencies
RUN apt-get update
RUN apt-get install -y vim curl wget tar screen python python-pip net-tools git build-essential software-properties-common rsyslog

# set utc+9
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

ENTRYPOINT cron && rsyslogd && bash

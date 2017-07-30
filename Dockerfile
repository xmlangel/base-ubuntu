FROM ubuntu:16.04

MAINTAINER Kwangmyung Kim <kwangmyung.kim@gmail.com>

RUN apt-get clean && apt-get update
RUN apt-get install locales

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
RUN apt-get update && apt-get install -y --no-install-recommends \
                autoconf \
                automake \
                bzip2 \
                file \
                g++ \
                gcc \
                imagemagick \
                libbz2-dev \
                libc6-dev \
                libcurl4-openssl-dev \
                libdb-dev \
                libevent-dev \
                libffi-dev \
                libgdbm-dev \
                libgeoip-dev \
                libglib2.0-dev \
                libjpeg-dev \
                libkrb5-dev \
                liblzma-dev \
                libmagickcore-dev \
                libmagickwand-dev \
                libncurses-dev \
                libpng-dev \
                libpq-dev \
                libreadline-dev \
                libsqlite3-dev \
                libssl-dev \
                libtool \
                libwebp-dev \
                libxml2-dev \
                libxslt-dev \
                libyaml-dev \
                make \
                patch \
                xz-utils \
                zlib1g-dev \
                tcl \
                tk \
                git \
                build-essential \
                curl \
                wget \
                software-properties-common \
                vim \
                screen \
                net-tools \
                && rm -rf /var/lib/apt/lists/*

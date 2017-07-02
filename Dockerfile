FROM bmartel/ruby:2.4-base
MAINTAINER Brandon Martel <brandonmartel@gmail.com>

ENV PATH=$HOME/.yarn/bin:$PATH

# Base dependencies
RUN apk --update add --no-cache --virtual \
  curl \
  tar \
  git \
  mailcap \
  imagemagick \
  postgresql-dev \
  tzdata \
  nodejs \
  yarn \
  fontconfig && \

# Install phantomjs
  mkdir phantomjs && cd phantomjs && \
  curl -L https://github.com/Overbryd/docker-phantomjs-alpine/releases/download/2.11/phantomjs-alpine-x86_64.tar.bz2 | tar -xj && \
  cd ../ && ls -la ./phantomjs/phantomjs && mv -f ./phantomjs/phantomjs /usr/bin/phantomjs && \

# Clean up dependencies
  rm -rf ./phantomjs && \
  find / -type f -iname \*.apk-new -delete && \
  rm -rf /var/cache/apk/* && \
  rm -rf /usr/lib/lib/ruby/gems/*/cache/*

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

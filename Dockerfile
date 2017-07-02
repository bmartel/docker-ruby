FROM ruby:2.4-alpine
MAINTAINER Brandon Martel <brandonmartel@gmail.com>

ENV YARN_PACKAGES="curl bash binutils tar"
ENV PATH=$HOME/.yarn/bin:$PATH

# Base dependencies
RUN apk --update add --virtual \
  build-dependencies \
  build-base \
  ca-certificates \
  openssl \
  git \
  mailcap \
  imagemagick \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  nodejs \
  tzdata \
  $YARN_PACKAGES \
  fontconfig && \
  mkdir -p /usr/share && \
  cd /usr/share && \
  curl -L https://github.com/Overbryd/docker-phantomjs-alpine/releases/download/2.11/phantomjs-alpine-x86_64.tar.bz2 | tar xj && \
  ln -s /usr/share/phantomjs/phantomjs /usr/bin/phantomjs && \
  touch $HOME/.bashrc
  
# Install Yarn
RUN \
  curl -o- -L https://yarnpkg.com/install.sh | bash && \

# Clean up Yarn and other dependencies
  find / -type f -iname \*.apk-new -delete && \
  rm -rf /var/cache/apk/* && \
  rm -rf /usr/lib/lib/ruby/gems/*/cache/* && \
  rm $HOME/.bashrc && \
  apk del $YARN_PACKAGES

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

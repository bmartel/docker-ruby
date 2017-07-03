FROM bmartel/ruby:2.4-base
MAINTAINER Brandon Martel <brandonmartel@gmail.com>

ENV PATH=$HOME/.yarn/bin:$PATH

# Base dependencies
RUN apk add --update --no-cache --virtual build-dependencies build-base git mailcap imagemagick sqlite-dev libxml2-dev libxslt-dev postgresql-dev tzdata nodejs yarn fontconfig curl tar && \

# Clean up dependencies
  find / -type f -iname \*.apk-new -delete && \
  rm -rf /var/cache/apk/* && \
  rm -rf /usr/lib/lib/ruby/gems/*/cache/*

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

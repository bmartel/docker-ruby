FROM ruby:2.3-slim
MAINTAINER Brandon Martel "brandonmartel@gmail.com"
RUN apt-get update && apt-get install -qq -y build-essential nodejs libpq-dev postgresql-client-9.4 imagemagick git --fix-missing --no-install-recommends && gem install bundler

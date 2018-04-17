FROM bmartel/ruby:2.5-base
MAINTAINER Brandon Martel <brandonmartel@gmail.com>
RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH
ADD Gemfile $APP_PATH
ADD Gemfile.lock $APP_PATH
RUN bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3

COPY . $APP_PATH
EXPOSE 3000
CMD bundle exec rake db:create && bundle exec rake db:migrate && rm -rf ./tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0

#!/bin/sh
set -e

PGDATA="/var/lib/postgresql/data"
# Start postgres
exec su-exec postgres postgres -D "$PGDATA" &

RAILS_VERSION=5.2.1

while getopts ":v:" opt; do
  case $opt in
    a)
      RAILS_VERSION="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "You must specify a rails version to use as an option to -$OPTARG" >&2
      exit 1
      ;;
  esac
done

mkdir -p /usr/src/app
cd /usr/src/app

gem install bundler 
gem install rails -v "$RAILS_VERSION"

rails new "$1" -T -d postgresql -m https://raw.githubusercontent.com/bmartel/vine/master/template.rb
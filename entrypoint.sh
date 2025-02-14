#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec rails assets:precompile

rails db:create
rails db:migrate
rails db:seed

bundle exec rails s -b 0.0.0.0
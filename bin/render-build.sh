#!/usr/bin/env bash
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

bundle exec rails db:migrate
bundle exec rails runner 'Rails.application.load_seed if Movie.count.zero?'

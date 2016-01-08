#!/bin/sh

rbenv install -s
gem install bundler
bundle install

cp -n .env.development.example .env.development

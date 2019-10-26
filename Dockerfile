FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y nodejs

RUN mkdir /app
WORKDIR /app

COPY ./app/Gemfile /app/Gemfile
COPY ./app/Gemfile.lock /app/Gemfile.lock

RUN bundle install

FROM ruby:3.1.2

RUN mkdir /app
WORKDIR /app

COPY Gemfile* ./

RUN gem install bundler && bundler install

COPY bin/ bin/
COPY src/ src/

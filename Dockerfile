FROM ruby:2.4.1


RUN apt-get update && apt-get install -y \
  build-essential  \
  nodejs  

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

ENV LANG C.UTF-8

ENV app /app
RUN mkdir $app
WORKDIR $app
ADD . $app

EXPOSE 4000

CMD bundle exec jekyll serve -H 0.0.0.0 --trace
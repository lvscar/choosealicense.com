FROM ruby:2.4.1


RUN apt-get update && apt-get install -y \
  build-essential  \
  nodejs

ENV LANG C.UTF-8
ENV app /app
ENV gem /ruby-gem

RUN mkdir $gem
COPY Gemfile* $gem
WORKDIR $gem

RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org
RUN bundle install

RUN mkdir $app
WORKDIR $app
ADD . $app

EXPOSE 4000


# production 
# CMD bundle exec jekyll serve -H 0.0.0.0 --trace

# dev 
CMD bundle exec jekyll serve -H 0.0.0.0 --trace  --force_polling
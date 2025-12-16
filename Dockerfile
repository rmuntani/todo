FROM ruby:3.4.7

WORKDIR /rails

ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle"

COPY Gemfile Gemfile.lock vendor ./

RUN bundle install 

COPY . .

CMD ["bundle exec rails s -b 0.0.0.0 -p 3000"]

FROM ruby:2.3

RUN apt-get update && apt-get -y install git sqlite3

RUN git clone https://github.com/rbCAS/CASinoApp.git /casinoapp
WORKDIR /casinoapp

ENV RAILS_ENV production
RUN bundle install --deployment --without development test

COPY cas.yml config/cas.yml
COPY database.yml config/database.yml
COPY rails script/rails
COPY production.rb config/environments/production.rb

RUN bundle exec rake db:schema:load
RUN bundle exec rake assets:precompile

CMD bundle exec rails s

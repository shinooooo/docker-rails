FROM ruby:2.5.7

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

WORKDIR /myapp
COPY src/Gemfile /myapp/Gemfile
COPY src/Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY ./src /myapp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
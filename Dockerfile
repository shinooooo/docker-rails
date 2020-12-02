# Ruby version
FROM ruby:2.5.7

# reqiure packege install
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

# work dierectory
RUN mkdir /my_app

# assign work directory as APP_ROOT
ENV APP_ROOT /my_app
WORKDIR $APP_ROOT

# copy host gemfile
ADD ./templates/Gemfile $APP_ROOT/Gemfile
ADD ./templates/Gemfile.lock $APP_ROOT/Gemfile.lock

# bundle install Gemfile
RUN bundle install
ADD ./templates/.gitignore $APP_ROOT/.gitignore
ADD ./src/ $APP_ROOT

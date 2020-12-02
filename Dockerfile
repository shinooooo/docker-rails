# Ruby version
FROM ruby:2.5.7

# reqiure  packege install
RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

# work dierectory
RUN mkdir /app_name

# assign work directory as APP_ROOT
ENV APP_ROOT /app_name
WORKDIR $APP_ROOT

# copy host gemfile
ADD ./src/Gemfile $APP_ROOT/Gemfile
ADD ./src/.gitignore $APP_ROOT/.gitignore
ADD ./src/Gemfile.lock $APP_ROOT/Gemfile.lock

# bundle install Gemfile
RUN bundle install
ADD ./src/ $APP_ROOT

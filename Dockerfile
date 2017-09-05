FROM ruby:latest

RUN gem install rails

RUN gem install puma

RUN apt-get update

# Get latest nodejs PPA
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

# install nodejs and npm
RUN apt-get install -y nodejs

# get latest yarn repo
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN mkdir /cwds

WORKDIR /cwds

ADD Gemfile /cwds/Gemfile
ADD Gemfile.lock /cwds/Gemfile.lock

RUN bundle install

ADD . /cwds
FROM ruby:2.7.2

RUN apt update && apt install -y \
  nodejs \
  postgresql-client \
  curl \
  build-essential \
  libpq-dev && \
  curl -sL https://deb.nodesource.com/setup_15.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

RUN groupadd -g 1000 app && useradd -r -u 1000 -g app app

RUN gem update --system

RUN gem install bundler -v 2.1.4

WORKDIR /myapp

COPY package.json /myapp/

RUN yarn install

COPY Gemfile* /myapp/

RUN bundle install

COPY . /myapp/

RUN mkdir tmp

RUN chmod -R 777 tmp

RUN chown -R app:root /myapp/

RUN usermod -d /myapp app

USER app

EXPOSE 3000

CMD /bin/sh -c "bundle install && ./bin/rails server -p 3000 -b '0.0.0.0'"

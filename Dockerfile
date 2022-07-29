FROM ruby:3.0.2

ENV BUNDLER_VERSION=2.0.2

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python \
      tzdata \
      yarn

ARG PORT_ARG=3000
ENV PORT=$PORT_ARG

ARG RAILS_ENV_ARG=development
ENV RAILS_ENV=$RAILS_ENV_ARG

ENV API_HOME=/app
RUN mkdir -p $API_HOME

COPY . $API_HOME/
WORKDIR $API_HOME

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries
RUN gem install bundler -v 2.0.2
RUN bundle check || bundle install

COPY package.json yarn.lock ./

RUN yarn install --check-files

# Use the following lines for Rails Apps
RUN chmod +x ./server.sh

# API Runner
EXPOSE $PORT

# Start rails server
CMD ["bash", "./server.sh"]

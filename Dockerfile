FROM ruby:3.0.0

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn postgresql-client

WORKDIR /myapp

COPY ./aplicacao/ . 

RUN bundle install

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
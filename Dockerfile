FROM ruby:3.1.0-bullseye

RUN wget https://dl.yarnpkg.com/debian/pubkey.gpg && apt-key add pubkey.gpg && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN apt update && apt install -y nodejs postgresql-client yarn

WORKDIR /trial-app
COPY ./Gemfile /trial-app/Gemfile
COPY ./Gemfile.lock /trial-app/Gemfile.lock

RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["./bin/dev"]

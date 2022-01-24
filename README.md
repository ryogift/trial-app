# trial-app

## first setup

Rewrite username and password

```
$ cat << EOF > .env
DB_USERNAME=username
DB_PASSWORD=password
EOF
```

docker build and db setup and yarn install

```sh
$ docker-compose build
$ docker-compose run --rm app rails db:setup
$ docker-compose run --rm app rails yarn:install
```

## develop

```sh
$ docker-compose up -d
$ docker-compose exec app /bin/bash
```

testing

```sh
$ ./bin/rails test
```

rubocop

```sh
$ ./bin/bundle exec rubocop
```

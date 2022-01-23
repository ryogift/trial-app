# trial-app

## first setup

Rewrite username and password

```
$ cat << EOF > .env
DB_USERNAME=username
DB_PASSWORD=password
EOF
```

docker build and db setup

```sh
$ docker-compose build
$ docker-compose run --rm app rails db:setup
```

## develop

```sh
$ docker-compose up -d
$ docker-compose exec app /bin/bash
```

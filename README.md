# trial-app

## first setup

```sh
$ docker-compose build
$ docker-compose run --rm app rails db:setup
```

## Develop

```sh
$ docker-compose up -d
$ docker-compose exec app /bin/bash
```

# docker-laravel

## Run docker and build:
```
docker compose up -d --build
```
## Run command line in container:
```
docker compose run --rm php /bin/sh
```
## Create laravel project via composer:
```
docker compose run --rm composer create-project laravel/laravel .
```
atau gunakan versi lain
```
docker compose run --rm composer create-project laravel/laravel:^10.0 .
```
## If access Forbidden:
pada saat running pertama kali akan error karena gak bisa akses file tertentu gunakan peritnah berikut

```
docker compose run --rm php /bin/sh
```
 
```
chown -R laravel:laravel /var/www/html
```

## komen laravel lainnya

```
docker-compose run --rm artisan migrate
```

```
docker-compose run --rm npm run dev
```

gunakan untuk akses artisan yang biasanya di lokal dengan untuk `docker compose up -d --build` 
```
docker-compose run --rm <perintah laravelmu>
```

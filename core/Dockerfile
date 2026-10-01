FROM php:8.3-cli 
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer 
RUN apt-get update && apt-get install -y libgmp-dev && docker-php-ext-install bcmath gmp

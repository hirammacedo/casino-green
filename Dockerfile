FROM php:8.3

WORKDIR /app
COPY . .
RUN apt-get update && apt-get install -y curl git && rm -rf /var/lib/apt/lists/*
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN cd core && composer install --no-dev
EXPOSE 8000
CMD ["sh", "-c", "cd core && php artisan serve --host=0.0.0.0 --port=8000"]

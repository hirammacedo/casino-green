FROM php:8.3-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    sqlite3 \
    libpq-dev \
    libmysqlclient-dev \
    && docker-php-ext-install \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory to core
WORKDIR /var/www/html

# Copy entire project
COPY . .

# Install PHP dependencies in core
RUN cd core && composer install --no-interaction --optimize-autoloader --no-dev

# Fix permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port
EXPOSE 8000

# Run from core directory
WORKDIR /var/www/html/core
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]

#!/bin/sh

# Create .env from environment variables if it doesn't exist
if [ ! -f /app/core/.env ]; then
    cat > /app/core/.env << EOF
APP_NAME=${APP_NAME:-GREEN}
APP_ENV=production
APP_KEY=${APP_KEY:-base64:abcdefghijklmnopqrstuvwxyz1234567890=}
APP_DEBUG=false
APP_TIMEZONE=UTC
APP_URL=https://casino-green.fly.dev
LOG_CHANNEL=single
DB_CONNECTION=sqlite
EOF
fi

# Start the web server - ignore all database-related errors
cd /app/core && php artisan serve --host=0.0.0.0 --port=8000 2>&1 | {
    while IFS= read -r line; do
        # Only print non-database error lines
        if ! echo "$line" | grep -q "SQLSTATE\|Connection\|database\|Schema"; then
            echo "$line"
        fi
    done
}

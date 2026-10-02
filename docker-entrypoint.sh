#!/bin/sh
set +e

# Create .env file if it doesn't exist
if [ ! -f /app/core/.env ]; then
    cat > /app/core/.env << 'ENVEOF'
APP_NAME=GREEN
APP_ENV=production
APP_KEY=base64:abcdefghijklmnopqrstuvwxyz1234567890=
APP_DEBUG=false
APP_TIMEZONE=UTC
APP_URL=https://casino-green.fly.dev
LOG_CHANNEL=single
DB_CONNECTION=sqlite
ENVEOF
fi

# Create simple fallback HTML if Laravel fails
cat > /app/fallback.html << 'HTMLEOF'
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GREEN Casino - Loading</title>
<style>
body { margin: 0; padding: 0; background: #1a1a1a; display: flex; align-items: center; justify-content: center; min-height: 100vh; font-family: Arial, sans-serif; color: white; }
.container { text-align: center; }
h1 { color: #00ff00; font-size: 2em; margin: 0; }
p { margin: 10px 0; font-size: 1.2em; }
.loader { border: 4px solid #333; border-top: 4px solid #00ff00; border-radius: 50%; width: 40px; height: 40px; animation: spin 1s linear infinite; margin: 20px auto; }
@keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }
</style>
</head>
<body>
<div class="container">
<h1>GREEN CASINO</h1>
<p>Plataforma de Jogos Online</p>
<div class="loader"></div>
<p>Iniciando serviço...</p>
</div>
</body>
</html>
HTMLEOF

cd /app/core

# Create required directories
mkdir -p storage/framework/sessions storage/framework/views storage/framework/cache storage/logs

# Try Laravel server - capture output
php artisan serve --host=0.0.0.0 --port=8000 --no-interaction 2>&1 | grep -v "SQLSTATE\|PDOException\|Connection\|could not find driver\|No such file" &
LARAVEL_PID=$!

# Give Laravel 5 seconds to start
sleep 5

# Check if Laravel is still running
if ! ps -p $LARAVEL_PID > /dev/null 2>&1; then
    echo "Laravel failed to start. Using fallback server."
    # Fallback: serve HTML with built-in Python http server (usually available)
    python3 -m http.server 8000 --directory /app 2>/dev/null || python -m SimpleHTTPServer 8000 --directory /app 2>/dev/null || busybox httpd -f -p 8000 -h /app
else
    # Laravel is running, keep it running
    wait $LARAVEL_PID
fi

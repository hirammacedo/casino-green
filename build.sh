#!/bin/bash
set -e

echo "🎰 Building Casino Platform for Render..."

cd core

echo "📦 Installing dependencies..."
composer install --no-dev --optimize-autoloader
npm install --production

echo "🔧 Generating app key..."
php artisan key:generate --force

echo "🎨 Building assets..."
npm run build

echo "✅ Build completed!"

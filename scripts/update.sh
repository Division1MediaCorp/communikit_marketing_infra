#!/bin/bash

set -e

SERVICE=$1

if [ -z "$SERVICE" ]; then
    echo "Usage: ./scripts/update.sh [base|fn|muni|all]"
    exit 1
fi

echo "🔄 Updating $SERVICE..."

if [ "$SERVICE" = "all" ]; then
    echo "📥 Updating all submodules..."
    git submodule update --remote --merge
    git add .
    git commit -m "Update all submodules to latest" || echo "No changes to commit"
    
    echo "🔧 Rebuilding all services..."
    docker-compose build --no-cache
    docker-compose up -d
    echo "✅ All services updated!"
else
    echo "📥 Updating $SERVICE submodule..."
    git submodule update --remote --merge "$SERVICE"
    git add "$SERVICE"
    git commit -m "Update $SERVICE submodule to latest" || echo "No changes to commit"
    
    echo "🔧 Rebuilding $SERVICE service..."
    docker-compose build --no-cache "${SERVICE}-app"
    docker-compose up -d "${SERVICE}-app"
    echo "✅ $SERVICE service updated!"
fi

echo ""
echo "📊 Service Status:"
docker-compose ps
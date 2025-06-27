#!/bin/bash

set -e

echo "🚀 Starting production deployment..."

# Update all submodules to latest
echo "📥 Updating submodules to latest..."
git submodule update --remote --merge

# Create Docker network if it doesn't exist
echo "📡 Creating Docker network..."
docker network create web 2>/dev/null || echo "Network 'web' already exists"

# Create necessary directories with proper permissions
echo "📁 Setting up directories..."
mkdir -p traefik/letsencrypt
mkdir -p logs
chmod 600 traefik/letsencrypt

# Pull latest images and build
echo "🔧 Building applications..."
docker-compose build --no-cache

# Stop existing containers
echo "🛑 Stopping existing containers..."
docker-compose down

# Start services
echo "🚀 Starting services..."
docker-compose up -d

# Wait for services to be healthy
echo "⏳ Waiting for services to be healthy..."
sleep 30

# Check if services are running
echo "🔍 Checking service status..."
docker-compose ps

echo ""
echo "✅ Deployment complete!"
echo ""
echo "Your applications are available at:"
echo "🌐 Base: https://communikit.com"
echo "🌐 FN: https://indigenous.communikit.com" 
echo "🌐 Muni: https://municipalities.communikit.com"
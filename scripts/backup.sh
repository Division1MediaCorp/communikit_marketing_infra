#!/bin/bash

set -e

BACKUP_DIR="/backup/communikit-$(date +%Y%m%d-%H%M%S)"

echo "💾 Creating backup at $BACKUP_DIR..."

mkdir -p "$BACKUP_DIR"

# Backup Let's Encrypt certificates
cp -r traefik/letsencrypt "$BACKUP_DIR/"

# Backup environment files
cp base/.env.production "$BACKUP_DIR/base.env.production"
cp fn/.env.production "$BACKUP_DIR/fn.env.production"
cp muni/.env.production "$BACKUP_DIR/muni.env.production"

# Backup docker-compose
cp docker compose.yml "$BACKUP_DIR/"

echo "✅ Backup created at $BACKUP_DIR"
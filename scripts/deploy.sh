#!/bin/bash
set -e

echo "Pulling latest umbrella repo..."
git pull

echo "Updating submodules to latest..."
git submodule update --init --recursive --remote

echo "Rebuilding and restarting containers..."
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build

echo "Deploy complete."
docker compose ps
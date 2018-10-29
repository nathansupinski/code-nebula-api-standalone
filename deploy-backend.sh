#!/bin/bash
# This file is needed only when you want to deploy the app to a Linux VM

deployPath=/opt/
echo "Using agent working directory: $1"
sudo rm -r "$deployPath/codenebula-backend"
sudo cp -r -v "$1/codenebulaBackend" "$deployPath/codenebula-backend"
sudo cp -v "/home/vellith/codenebula-backend-config/config.json" "$deployPath/codenebula-backend"
cd '/opt/codenebula-backend'
#set env var for production and install dependencies
sudo NODE_ENV=production npm install 
#reinit the pm2 process
pm2 delete codenebulaBackend -s
pm2 start server.js -n codenebulaBackend

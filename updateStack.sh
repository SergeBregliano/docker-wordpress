#!/bin/bash

# Create and adapt folders rights if needed
if [ ! -d "appData" ];then
	echo 'Creating appData folder'
	echo '============================'
	mkdir appData
	echo ''
fi
if [ ! -d "appData/wordpress" ];then
	echo 'Creating appData/wordpress folder'
	echo '============================'
	mkdir appData/wordpress
	echo ''
fi

# Update the stack
echo 'Updating configuration files'
echo '============================'
git pull https://github.com/SergeBregliano/docker-wordpress.git main
echo ''

# Download the new images version
echo 'Update and build new images'
echo '==========================='
docker pull wordpress:fpm
docker-compose pull
docker-compose build
echo ''

# Stop last stack, delete it, and start the new one
echo 'Shutting down servers'
echo '====================='
docker-compose down
echo ''

echo 'Deleting images'
echo '==============='
docker-compose rm -f
echo ''

echo 'Start new images'
echo '================'
docker-compose up -d --remove-orphans
echo ''

echo 'Your stack has been correctly updated.'
echo ''
echo ''
echo 'For first installation, remember to correct rights on wp-content :'
echo 'sudo chown -R 33:33 appData/wordpress/wp-content'
echo ''
echo ''
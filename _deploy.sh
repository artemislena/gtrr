#!/bin/sh

# Deploy site to server

cobalt build

find _site -name '*.css' -exec css-html-js-minify --quiet --overwrite {} \; && echo 'CSS minified.'

# Ensure correct permissions
find _site -type f -exec chmod 644 {} \;
find _site -type d -exec chmod 755 {} \;

echo 'Touch YubiKey'
rsync -a --progress --delete _site/ root@192.168.100.80:/srv/www/gtrr/

rm -r _site/ && echo 'Build files removed.'
